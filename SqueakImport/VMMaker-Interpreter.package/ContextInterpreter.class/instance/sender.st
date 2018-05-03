contexts
sender

	| context closureOrNil |
	context := localHomeContext.
	[(closureOrNil := objectMemory fetchPointer: ClosureIndex ofObject: context) ~~ objectMemory getNilObj] whileTrue:
		[context := objectMemory fetchPointer: ClosureOuterContextIndex ofObject: closureOrNil].
	^objectMemory fetchPointer: SenderIndex ofObject: context