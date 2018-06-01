frame access
marryFrame: theFP SP: theSP copyTemps: copyTemps 
	"Marry an unmarried frame. This means creating a spouse context
	initialized with a subset of the frame's state that references the frame.
	For the default closure implementation we do not need to copy
	temps. Different closure implementations may require temps to be
	copied. "
	| _gsSqueakTemp_theContext _gsSqueakTemp_methodHeader _gsSqueakTemp_numSlots _gsSqueakTemp_numArgs _gsSqueakTemp_numStack _gsSqueakTemp_closureOrNil _gsSqueakTemp_numTemps |
	self assert: (self frameHasContext: theFP) not.
	"The SP is expected to be pointing at the last oop on the stack, not at
	the pc"
	self
		assert: (objectMemory
				addressCouldBeOop: (stackPages longAt: theSP)).
	_gsSqueakTemp_methodHeader := objectMemory
				methodHeaderOf: (self frameMethod: theFP).
	"Decide how much of the stack to preserve in widowed contexts.
	Preserving too much
	state will potentially hold onto garbage. Holding onto too little may
	mean that a dead
	context isn't informative enough in a debugging situation. If
	copyTemps is false (as it
	is in the default closure implementation) compromise, retaining only
	the arguments with
	no temporaries. Note that we still set the stack pointer to its current
	value, but stack
	contents other than the arguments are nil."
	_gsSqueakTemp_numArgs := self frameNumArgs: theFP.
	_gsSqueakTemp_numStack := self stackPointerIndexForFrame: theFP WithSP: theSP.
	_gsSqueakTemp_closureOrNil := (self frameIsBlockActivation: theFP)
				ifTrue: [self pushedReceiverOrClosureOfFrame: theFP]
				ifFalse: [objectMemory nilObject].
	_gsSqueakTemp_numSlots := (self methodHeaderIndicatesLargeFrame: _gsSqueakTemp_methodHeader)
				ifTrue: [LargeContextSlots]
				ifFalse: [SmallContextSlots].
	_gsSqueakTemp_theContext := objectMemory eeInstantiateMethodContextSlots: _gsSqueakTemp_numSlots.
	self assert: _gsSqueakTemp_numStack + ReceiverIndex <= _gsSqueakTemp_numSlots.
	"Mark context as married by setting its sender to the frame pointer
	plus SmallInteger
	tags and the InstructionPointer to the saved fp (which ensures
	correct alignment
	w.r.t. the frame when we check for validity)"
	objectMemory
		storePointerUnchecked: SenderIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (self withSmallIntegerTags: theFP).
	objectMemory
		storePointerUnchecked: InstructionPointerIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (self
				withSmallIntegerTags: (self frameCallerFP: theFP)).
	objectMemory
		storePointerUnchecked: StackPointerIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (objectMemory integerObjectOf: _gsSqueakTemp_numStack).
	objectMemory
		storePointerUnchecked: MethodIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (self frameMethod: theFP).
	objectMemory
		storePointerUnchecked: ClosureIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: _gsSqueakTemp_closureOrNil.
	objectMemory
		storePointerUnchecked: ReceiverIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (self frameReceiver: theFP).
	"If copyTemps is false, store just the arguments. If the frame is
	divorced the context
	will have valid arguments but all temporaries will be nil."
	1
		to: _gsSqueakTemp_numArgs
		do: [:i | objectMemory
				storePointerUnchecked: ReceiverIndex + i
				ofObject: _gsSqueakTemp_theContext
				withValue: (stackPages longAt: theFP + FoxCallerSavedIP + (_gsSqueakTemp_numArgs - i + 1 * objectMemory wordSize))
			"inline self temporary: i - 1 in:theFP"].
	copyTemps
		ifTrue: [_gsSqueakTemp_numTemps := self frameNumTemps: theFP.
			1
				to: _gsSqueakTemp_numTemps
				do: [:i | objectMemory
						storePointerUnchecked: ReceiverIndex + i + _gsSqueakTemp_numArgs
						ofObject: _gsSqueakTemp_theContext
						withValue: (self temporary: i - 1 in: theFP)].
			_gsSqueakTemp_numArgs := _gsSqueakTemp_numArgs + _gsSqueakTemp_numTemps].
	_gsSqueakTemp_numArgs + 1
		to: _gsSqueakTemp_numStack
		do: [:i | objectMemory
				storePointerUnchecked: ReceiverIndex + i
				ofObject: _gsSqueakTemp_theContext
				withValue: objectMemory nilObject].
	self setFrameContext: theFP to: _gsSqueakTemp_theContext.
	self setFrameHasContext: theFP.
	self
		assert: (self frameHasContext: theFP).
	self assert: (self frameOfMarriedContext: _gsSqueakTemp_theContext)
			= theFP.
	self assert: _gsSqueakTemp_numStack + ReceiverIndex
			< (objectMemory lengthOf: _gsSqueakTemp_theContext).
	^ _gsSqueakTemp_theContext