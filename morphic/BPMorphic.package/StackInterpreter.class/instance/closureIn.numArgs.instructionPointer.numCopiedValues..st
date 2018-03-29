control primitives
closureIn: context numArgs: numArgs instructionPointer: initialIP numCopiedValues: numCopied 
	| _gsSqueakTemp_newClosure |
	ClassBlockClosureCompactIndex ~= 0
		ifTrue: [_gsSqueakTemp_newClosure := objectMemory
						eeInstantiateSmallClassIndex: ClassBlockClosureCompactIndex
						format: objectMemory indexablePointersFormat
						numSlots: ClosureFirstCopiedValueIndex + numCopied]
		ifFalse: [_gsSqueakTemp_newClosure := objectMemory
						eeInstantiateSmallClass: (objectMemory splObj: ClassBlockClosure)
						numSlots: ClosureFirstCopiedValueIndex + numCopied].
	"Assume: have just allocated a new closure; it must be young. Thus,
	can use unchecked stores."
	objectMemory
		storePointerUnchecked: ClosureOuterContextIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: context.
	objectMemory
		storePointerUnchecked: ClosureStartPCIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: (objectMemory integerObjectOf: initialIP).
	objectMemory
		storePointerUnchecked: ClosureNumArgsIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: (objectMemory integerObjectOf: numArgs).
	^ _gsSqueakTemp_newClosure