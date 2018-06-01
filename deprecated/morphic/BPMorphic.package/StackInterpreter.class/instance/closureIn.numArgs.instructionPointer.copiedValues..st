control primitives
closureIn: context numArgs: numArgs instructionPointer: initialIP copiedValues: copiedValues 
	| _gsSqueakTemp_newClosure _gsSqueakTemp_numCopied |
	"numCopied should be zero for nil"
	_gsSqueakTemp_numCopied := objectMemory numSlotsOf: copiedValues.
	ClassBlockClosureCompactIndex ~= 0
		ifTrue: [_gsSqueakTemp_newClosure := objectMemory
						eeInstantiateSmallClassIndex: ClassBlockClosureCompactIndex
						format: objectMemory indexablePointersFormat
						numSlots: ClosureFirstCopiedValueIndex + _gsSqueakTemp_numCopied]
		ifFalse: [_gsSqueakTemp_newClosure := objectMemory
						eeInstantiateSmallClass: (objectMemory splObj: ClassBlockClosure)
						numSlots: ClosureFirstCopiedValueIndex + _gsSqueakTemp_numCopied].
	"Assume: have just allocated a new closure; it must be young. Thus,
	can use unchecked stores."
	objectMemory
		storePointerUnchecked: ClosureOuterContextIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: context;
		
		storePointerUnchecked: ClosureStartPCIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: (objectMemory integerObjectOf: initialIP);
		
		storePointerUnchecked: ClosureNumArgsIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: (objectMemory integerObjectOf: numArgs).
	0
		to: _gsSqueakTemp_numCopied - 1
		do: [:i | objectMemory
				storePointerUnchecked: i + ClosureFirstCopiedValueIndex
				ofObject: _gsSqueakTemp_newClosure
				withValue: (objectMemory fetchPointer: i ofObject: copiedValues)].
	^ _gsSqueakTemp_newClosure