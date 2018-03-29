frame access
externalSetStackPageAndPointersForSuspendedContextOfProcess: aProcess 
	"Set stackPage, instructionPointer, framePointer and stackPointer for
	the suspendedContext of
	aProcess, marrying the context if necessary, and niling the
	suspendedContext slot. This is used
	on process switch to ensure a context has a stack frame and so can
	continue execution."
	| _gsSqueakTemp_newContext _gsSqueakTemp_theFrame _gsSqueakTemp_thePage _gsSqueakTemp_newPage |
	_gsSqueakTemp_newContext := objectMemory fetchPointer: SuspendedContextIndex ofObject: aProcess.
	self
		assert: (objectMemory isContext: _gsSqueakTemp_newContext).
	(self isMarriedOrWidowedContext: _gsSqueakTemp_newContext)
		ifTrue: [self
				assert: (self checkIsStillMarriedContext: _gsSqueakTemp_newContext currentFP: framePointer)].
	objectMemory
		storePointerUnchecked: SuspendedContextIndex
		ofObject: aProcess
		withValue: objectMemory nilObject.
	(self isStillMarriedContext: _gsSqueakTemp_newContext)
		ifTrue: [_gsSqueakTemp_theFrame := self frameOfMarriedContext: _gsSqueakTemp_newContext.
			_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFrame.
			_gsSqueakTemp_theFrame ~= _gsSqueakTemp_thePage headFP
				ifTrue: ["explicit assignment of suspendedContext can cause
					switch to interior frame."
					_gsSqueakTemp_newPage := stackPages newStackPage.
					self
						moveFramesIn: _gsSqueakTemp_thePage
						through: (self findFrameAbove: _gsSqueakTemp_theFrame inPage: _gsSqueakTemp_thePage)
						toPage: _gsSqueakTemp_newPage.
					stackPages markStackPageLeastMostRecentlyUsed: _gsSqueakTemp_newPage].
			self assert: _gsSqueakTemp_thePage headFP = _gsSqueakTemp_theFrame]
		ifFalse: [_gsSqueakTemp_thePage := self makeBaseFrameFor: _gsSqueakTemp_newContext.
			_gsSqueakTemp_theFrame := _gsSqueakTemp_thePage baseFP].
	self setStackPageAndLimit: _gsSqueakTemp_thePage.
	self setStackPointersFromPage: _gsSqueakTemp_thePage.
	(self isMachineCodeFrame: framePointer)
		ifFalse: [self
				setMethod: (self iframeMethod: framePointer)].
	instructionPointer := self popStack.
	self
		assertValidExecutionPointe: instructionPointer
		r: framePointer
		s: stackPointer