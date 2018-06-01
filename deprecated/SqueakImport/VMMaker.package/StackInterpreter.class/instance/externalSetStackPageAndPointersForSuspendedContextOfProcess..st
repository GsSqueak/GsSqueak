frame access
externalSetStackPageAndPointersForSuspendedContextOfProcess: aProcess
	"Set stackPage, framePointer and stackPointer for the suspendedContext of aProcess,
	 marrying the context if necessary, and niling the suspendedContext slot.  This is used
	 on process switch to ensure a context has a stack frame and so can continue execution."
	| newContext theFrame thePage |
	<var: #theFrame type: #'char *'>
	<var: #thePage type: #'StackPage *'>
	
	newContext := objectMemory fetchPointer: SuspendedContextIndex ofObject: aProcess.
	self assert: (self isContext: newContext).
	(self isMarriedOrWidowedContext: newContext) ifTrue:
		[self assert: (self checkIsStillMarriedContext: newContext currentFP: framePointer)].
	objectMemory storePointerUnchecked: SuspendedContextIndex ofObject: aProcess withValue: objectMemory nilObject.
	(self isStillMarriedContext: newContext)
		ifTrue:
			[theFrame := self frameOfMarriedContext: newContext.
			 thePage := stackPages stackPageFor: theFrame]
		ifFalse:
			[thePage := self makeBaseFrameFor: newContext.
			 theFrame := thePage baseFP].
	self assert: thePage headFP = theFrame.
	self setStackPageAndLimit: thePage.
	stackPointer := thePage headSP.
	framePointer := thePage headFP.
	(self isMachineCodeFrame: framePointer) ifFalse:
		[self setMethod: (self iframeMethod: framePointer)].
	self assertValidExecutionPointe: self stackTop asUnsignedInteger r: framePointer s: stackPointer