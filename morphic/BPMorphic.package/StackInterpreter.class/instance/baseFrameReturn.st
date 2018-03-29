return bytecodes
baseFrameReturn
	"Return from a baseFrame (the bottom frame in a stackPage). The
	context to
	return to (which may be married) is stored in the saved instruction
	pointer slot."
	| _gsSqueakTemp_contextToReturnTo _gsSqueakTemp_isAContext _gsSqueakTemp_theFP _gsSqueakTemp_theSP _gsSqueakTemp_thePage _gsSqueakTemp_frameAbove |
	_gsSqueakTemp_contextToReturnTo := self frameCallerContext: localFP.
	_gsSqueakTemp_isAContext := objectMemory isContext: _gsSqueakTemp_contextToReturnTo.
	(_gsSqueakTemp_isAContext
			and: [self isStillMarriedContext: _gsSqueakTemp_contextToReturnTo])
		ifTrue: [_gsSqueakTemp_theFP := self frameOfMarriedContext: _gsSqueakTemp_contextToReturnTo.
			_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
			_gsSqueakTemp_theFP = _gsSqueakTemp_thePage headFP
				ifTrue: [_gsSqueakTemp_theSP := _gsSqueakTemp_thePage headSP.
					stackPages freeStackPageNoAssert: stackPage
					"for a short time invariant is violated; assert follows"]
				ifFalse: ["Returning to some interior frame, presumably
					because of a sender assignment.
					Move the frames above to another page (they may be
					in use, e.g. via coroutining).
					Make the interior frame the top frame."
					_gsSqueakTemp_frameAbove := self findFrameAbove: _gsSqueakTemp_theFP inPage: _gsSqueakTemp_thePage.
					"Reuse the page we're exiting, which avoids allocating
					a new page and
					manipulating the page list to mark the page we're
					entering as least recently
					used (to avoid it being deallocated when allocating a
					new page)."
					self
						moveFramesIn: _gsSqueakTemp_thePage
						through: _gsSqueakTemp_frameAbove
						toPage: stackPage.
					_gsSqueakTemp_theFP := _gsSqueakTemp_thePage headFP.
					_gsSqueakTemp_theSP := _gsSqueakTemp_thePage headSP]]
		ifFalse: [(_gsSqueakTemp_isAContext
					and: [objectMemory
							isIntegerObject: (objectMemory fetchPointer: InstructionPointerIndex ofObject: _gsSqueakTemp_contextToReturnTo)])
				ifFalse: [^ self internalCannotReturn: localReturnValue].
			_gsSqueakTemp_thePage := self makeBaseFrameFor: _gsSqueakTemp_contextToReturnTo.
			_gsSqueakTemp_theFP := _gsSqueakTemp_thePage headFP.
			_gsSqueakTemp_theSP := _gsSqueakTemp_thePage headSP.
			stackPages freeStackPageNoAssert: stackPage
			"for a short time invariant is violated; assert follows"].
	self setStackPageAndLimit: _gsSqueakTemp_thePage.
	self assert: (stackPages stackPageFor: _gsSqueakTemp_theFP)
			= stackPage.
	localSP := _gsSqueakTemp_theSP.
	localFP := _gsSqueakTemp_theFP.
	self
		setMethod: (self frameMethod: localFP).
	localIP := self pointerForOop: self internalStackTop.
	self internalStackTopPut: localReturnValue.
	self
		assert: (self checkIsStillMarriedContext: _gsSqueakTemp_contextToReturnTo currentFP: localFP).
	^ self fetchNextBytecode