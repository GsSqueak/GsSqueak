control primitives
fullClosureIn: context numArgs: numArgs numCopiedValues: numCopied compiledBlock: compiledBlock 
	| _gsSqueakTemp_newClosure |
	ClassFullBlockClosureCompactIndex ~= 0
		ifTrue: [_gsSqueakTemp_newClosure := objectMemory
						eeInstantiateSmallClassIndex: ClassFullBlockClosureCompactIndex
						format: objectMemory indexablePointersFormat
						numSlots: FullClosureFirstCopiedValueIndex + numCopied]
		ifFalse: [_gsSqueakTemp_newClosure := objectMemory
						eeInstantiateSmallClass: (objectMemory splObj: ClassFullBlockClosure)
						numSlots: FullClosureFirstCopiedValueIndex + numCopied].
	"Assume: have just allocated a new closure; it must be young. Thus,
	can use unchecked stores."
	objectMemory
		storePointerUnchecked: ClosureOuterContextIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: context;
		
		storePointerUnchecked: FullClosureCompiledBlockIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: compiledBlock;
		
		storePointerUnchecked: ClosureNumArgsIndex
		ofObject: _gsSqueakTemp_newClosure
		withValue: (objectMemory integerObjectOf: numArgs).
	^ _gsSqueakTemp_newClosure