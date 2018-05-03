frame access
updateStateOfSpouseContextForFrame: theFP WithSP: theSP
	"Update the frame's spouse context with the frame's current state except for the
	 sender and instruction pointer, which are used to mark the context as married."
	| theContext tempIndex pointer |
	<inline: false>
	<var: #theFP type: #'char *'>
	<var: #theSP type: #'char *'>
	<var: #pointer type: #'char *'>
	self assert: (self frameHasContext: theFP).
	theContext := self frameContext: theFP.
	self assert: (self frameReceiver: theFP)
				= (objectMemory fetchPointer: ReceiverIndex ofObject: theContext).
	tempIndex := self frameNumArgs: theFP.
	pointer := theFP + FoxReceiver - objectMemory bytesPerWord.
	[pointer >= theSP] whileTrue:
		[self assert: (objectMemory addressCouldBeOop: (stackPages longAt: pointer)).
		 tempIndex := tempIndex + 1.
		 objectMemory storePointer: ReceiverIndex + tempIndex
			ofObject: theContext
			withValue: (stackPages longAt: pointer).
		 pointer := pointer - objectMemory bytesPerWord].
	self assert: ReceiverIndex + tempIndex < (objectMemory lengthOf: theContext).
	objectMemory storePointerUnchecked: StackPointerIndex
		ofObject: theContext
		withValue: (objectMemory integerObjectOf: tempIndex)