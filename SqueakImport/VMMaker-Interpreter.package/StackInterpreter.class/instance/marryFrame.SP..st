frame access
marryFrame: theFP SP: theSP
	"Marry an unmarried frame.  This means creating a spouse context
	 initialized with a subset of the frame's state (state through the last argument)
	 that references the frame."
	| theContext methodHeader byteSize numArgs numStack closureOrNil |
	<inline: false>
	<var: #theFP type: #'char *'>
	<var: #theSP type: #'char *'>
	self assert: (self frameHasContext: theFP) not.

	methodHeader := self headerOf: (self frameMethod: theFP).
	"Decide how much of the stack to preserve in widowed contexts.  Preserving too much
	 state will potentially hold onto garbage.  Holding onto too little may mean that a dead
	 context isn't informative enough in a debugging situation.  We compromise, retaining
	 only the arguments with no temporaries.  Note that we still set the stack pointer to its
	 current value, but stack contents other than the arguments are nil."
	numArgs := self frameNumArgs: theFP.
	numStack := self stackPointerIndexForFrame: theFP WithSP: theSP.

	closureOrNil := (self frameIsBlockActivation: theFP)
						ifTrue: [self pushedReceiverOrClosureOfFrame: theFP]
						ifFalse: [objectMemory nilObject].

	byteSize := (methodHeader bitAnd: LargeContextBit) ~= 0
					ifTrue: [LargeContextSize]
					ifFalse: [SmallContextSize].
	theContext := objectMemory eeInstantiateMethodContextByteSize: byteSize.
	self assert: numStack + ReceiverIndex << self shiftForWord + objectMemory baseHeaderSize <= byteSize. 
	"Mark context as married by setting its sender to the frame pointer plus SmallInteger
	 tags and the InstructionPointer to the saved fp (which ensures correct alignment
	 w.r.t. the frame when we check for validity)"
	objectMemory storePointerUnchecked: SenderIndex
		ofObject: theContext
		withValue: (self withSmallIntegerTags: theFP).
	objectMemory storePointerUnchecked: InstructionPointerIndex
		ofObject: theContext
		withValue: (self withSmallIntegerTags: (self frameCallerFP: theFP)).
	objectMemory storePointerUnchecked: StackPointerIndex
		ofObject: theContext
		withValue: (objectMemory integerObjectOf: numStack).
	objectMemory storePointerUnchecked: MethodIndex
		ofObject: theContext
		withValue: (self frameMethod: theFP).
	objectMemory storePointerUnchecked: ClosureIndex ofObject: theContext withValue: closureOrNil.
	objectMemory storePointerUnchecked: ReceiverIndex
		ofObject: theContext
		withValue: (self frameReceiver: theFP).
	"Store just the arguments.  If the frame is divorced the context
	 will have valid arguments but all temporaries will be nil."
	1 to: numArgs do:
		[:i|
		objectMemory storePointerUnchecked: ReceiverIndex + i
			ofObject: theContext "inline self temporary: i - 1 in:theFP" 
			withValue: (stackPages longAt: theFP
										+ FoxCallerSavedIP
										+ ((numArgs - i + 1) * objectMemory bytesPerWord))].
	numArgs + 1 to: numStack do:
		[:i|
		objectMemory storePointerUnchecked: ReceiverIndex + i
			ofObject: theContext
			withValue: objectMemory nilObject].

	stackPages longAt: theFP + FoxThisContext put: theContext.
	stackPages byteAt: theFP + FoxFrameFlags + 2 put: 1.

	self assert: (self frameHasContext: theFP).
	self assert: (self frameOfMarriedContext: theContext) = theFP.
	self assert: numStack + ReceiverIndex < (objectMemory lengthOf: theContext).

	^theContext
