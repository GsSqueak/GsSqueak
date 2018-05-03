object memory support
markAndTraceStackPage: thePage
	| theSP theFP frameRcvrOffset callerFP oop |
	<var: #thePage type: #'StackPage *'>
	<var: #theSP type: #'char *'>
	<var: #theFP type: #'char *'>
	<var: #frameRcvrOffset type: #'char *'>
	<var: #callerFP type: #'char *'>
	<inline: false>
	self assert: (stackPages isFree: thePage) not.
	theSP := thePage headSP.
	theFP := thePage  headFP.
	"Skip the instruction pointer on top of stack of inactive pages."
	thePage = stackPage ifFalse:
		[theSP := theSP + objectMemory bytesPerWord].
	[frameRcvrOffset := self frameReceiverOffset: theFP.
	 [theSP <= frameRcvrOffset] whileTrue:
		[oop := stackPages longAt: theSP.
		 (objectMemory isIntegerObject: oop) ifFalse:
			[objectMemory markAndTrace: oop].
		 theSP := theSP + objectMemory bytesPerWord].
	(self frameHasContext: theFP) ifTrue:
		[self assert: (self isContext: (self frameContext: theFP)).
		 objectMemory markAndTrace: (self frameContext: theFP)].
	objectMemory markAndTrace: (self iframeMethod: theFP).
	(callerFP := self frameCallerFP: theFP) ~= 0] whileTrue:
		[theSP := theFP + FoxCallerSavedIP + objectMemory bytesPerWord.
		 theFP := callerFP].
	theSP := self isCog
				ifTrue: [theFP + FoxCallerSavedIP + objectMemory bytesPerWord] "caller ip is ceBaseReturnPC"
				ifFalse: [theFP + FoxCallerSavedIP]. "caller ip is frameCallerContext in a base frame"
	[theSP <= thePage baseAddress] whileTrue:
		[oop := stackPages longAt: theSP.
		 (objectMemory isIntegerObject: oop) ifFalse:
			[objectMemory markAndTrace: oop].
		 theSP := theSP + objectMemory bytesPerWord]