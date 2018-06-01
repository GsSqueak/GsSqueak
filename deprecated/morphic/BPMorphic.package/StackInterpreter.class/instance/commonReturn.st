return bytecodes
commonReturn
	"Do an ^-return (return from method), checking for unwinds if this is a
	block activation.
	Note: Assumed to be inlined into the dispatch loop."
	| _gsSqueakTemp_closure _gsSqueakTemp_home _gsSqueakTemp_unwindContextOrNilOrZero _gsSqueakTemp_frameToReturnTo _gsSqueakTemp_contextToReturnTo _gsSqueakTemp_theFP _gsSqueakTemp_callerFP _gsSqueakTemp_newPage |
	"If this is a method simply return to the sender/caller."
	(self iframeIsBlockActivation: localFP)
		ifFalse: [^ self commonCallerReturn].
	"Since this is a block activation the closure is on the stack above any
	args and the frame."
	_gsSqueakTemp_closure := self pushedReceiverOrClosureOfFrame: localFP.
	_gsSqueakTemp_home := nil.
	"Walk the closure's lexical chain to find the context or frame to return
	from (home)."
	[_gsSqueakTemp_closure ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_home := objectMemory followField: ClosureOuterContextIndex ofObject: _gsSqueakTemp_closure.
			_gsSqueakTemp_closure := objectMemory followField: ClosureIndex ofObject: _gsSqueakTemp_home].
	"home is to be returned from provided there is no unwind-protect
	activation between
	this frame and home's sender. Search for an unwind.
	findUnwindThroughContext: will answer either the context for an
	unwind-protect activation or nilObj if the sender
	cannot be found or 0 if no unwind is found but the sender is. We
	must update the
	current page's headFrame pointers to enable the search to identify
	widowed contexts
	correctly."
	self writeBackHeadFramePointers.
	self externalizeIPandSP.
	_gsSqueakTemp_unwindContextOrNilOrZero := self findUnwindThroughContext: _gsSqueakTemp_home.
	_gsSqueakTemp_unwindContextOrNilOrZero = objectMemory nilObject
		ifTrue: ["error: can't find home on chain; cannot return"
			^ self internalCannotReturn: localReturnValue].
	_gsSqueakTemp_unwindContextOrNilOrZero ~= 0
		ifTrue: [^ self internalAboutToReturn: localReturnValue through: _gsSqueakTemp_unwindContextOrNilOrZero].
	"Now we know home is on the sender chain.
	We could be returning to either a context or a frame. Find out which."
	_gsSqueakTemp_contextToReturnTo := nil.
	(self isMarriedOrWidowedContext: _gsSqueakTemp_home)
		ifTrue: [self
				assert: (self checkIsStillMarriedContext: _gsSqueakTemp_home currentFP: localFP).
			_gsSqueakTemp_theFP := self frameOfMarriedContext: _gsSqueakTemp_home.
			(self isBaseFrame: _gsSqueakTemp_theFP)
				ifTrue: [_gsSqueakTemp_contextToReturnTo := self frameCallerContext: _gsSqueakTemp_theFP]
				ifFalse: [_gsSqueakTemp_frameToReturnTo := self frameCallerFP: _gsSqueakTemp_theFP]]
		ifFalse: [_gsSqueakTemp_contextToReturnTo := objectMemory fetchPointer: SenderIndex ofObject: _gsSqueakTemp_home.
			((objectMemory isContext: _gsSqueakTemp_contextToReturnTo)
					and: [self isMarriedOrWidowedContext: _gsSqueakTemp_contextToReturnTo])
				ifTrue: [self
						assert: (self checkIsStillMarriedContext: _gsSqueakTemp_contextToReturnTo currentFP: localFP).
					_gsSqueakTemp_frameToReturnTo := self frameOfMarriedContext: _gsSqueakTemp_contextToReturnTo.
					_gsSqueakTemp_contextToReturnTo := nil]].
	"If returning to a context we must make a frame for it unless it is dead."
	_gsSqueakTemp_contextToReturnTo ~= nil
		ifTrue: [_gsSqueakTemp_frameToReturnTo := self establishFrameForContextToReturnTo: _gsSqueakTemp_contextToReturnTo.
			_gsSqueakTemp_frameToReturnTo = 0
				ifTrue: ["error: home's sender is dead; cannot return"
					^ self internalCannotReturn: localReturnValue]].
	"Now we have a frame to return to. If it is on a different page we must
	free intervening pages and
	nil out intervening contexts. We must free intervening stack pages
	because if we leave the pages
	to be divorced then their contexts will be divorced with intact senders
	and instruction pointers. This
	code is similar to primitiveTerminateTo. We must move any frames on
	intervening pages above the
	frame linked to because these may be in use, e.g. via co-routining
	(see baseFrameReturn)."
	self assert: stackPages pageListIsWellFormed.
	_gsSqueakTemp_newPage := stackPages stackPageFor: _gsSqueakTemp_frameToReturnTo.
	_gsSqueakTemp_newPage ~~ stackPage
		ifTrue: [| currentCtx thePage nextCntx |
			currentCtx := self frameCallerContext: stackPage baseFP.
			stackPages freeStackPage: stackPage.
			[self
				assert: (objectMemory isContext: currentCtx).
			(self isMarriedOrWidowedContext: currentCtx)
				and: [(stackPages stackPageFor: (_gsSqueakTemp_theFP := self frameOfMarriedContext: currentCtx))
						= _gsSqueakTemp_newPage]]
				whileFalse: [(self isMarriedOrWidowedContext: currentCtx)
						ifTrue: [thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
							_gsSqueakTemp_theFP ~= thePage headFP
								ifTrue: ["Since we've just deallocated a page
									we know that newStackPage won't
									deallocate an existing one."
									self
										moveFramesIn: thePage
										through: (self findFrameAbove: _gsSqueakTemp_theFP inPage: thePage)
										toPage: stackPages newStackPage].
							currentCtx := self frameCallerContext: thePage baseFP.
							stackPages freeStackPage: thePage]
						ifFalse: [nextCntx := objectMemory fetchPointer: SenderIndex ofObject: currentCtx.
							self markContextAsDead: currentCtx.
							currentCtx := nextCntx]].
			self setStackPageAndLimit: _gsSqueakTemp_newPage.
			localSP := stackPage headSP.
			localFP := stackPage headFP].
	"Two cases. Returning to the top frame on a new page or an interior
	frame on the current page.
	The top frame has its instruction pointer on top of stack. An interior
	frame has its instruction pointer
	in the caller frame. We need to peel back any frames on the page
	until we get to the correct frame."
	localFP = _gsSqueakTemp_frameToReturnTo
		ifTrue: ["pop the saved IP, push the return value and continue."
			localIP := self pointerForOop: self internalStackTop]
		ifFalse: [[_gsSqueakTemp_callerFP := localFP.
			localFP := self frameCallerFP: localFP.
			localFP ~~ _gsSqueakTemp_frameToReturnTo] whileTrue.
			localIP := self frameCallerSavedIP: _gsSqueakTemp_callerFP.
			localSP := (self frameCallerSP: _gsSqueakTemp_callerFP)
						- objectMemory wordSize].
	self maybeReturnToMachineCodeFrame.
	self
		setMethod: (self frameMethod: localFP).
	self fetchNextBytecode.
	self internalStackTopPut: localReturnValue