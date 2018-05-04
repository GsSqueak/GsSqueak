debug printing
findHomeForContext: aContext
	| closureOrNil |
	<inline: false>
	closureOrNil := objectMemory fetchPointer: ClosureIndex ofObject: aContext.
	closureOrNil = objectMemory nilObject ifTrue:
		[^aContext].
	^self findHomeForContext: (objectMemory fetchPointer: ClosureOuterContextIndex ofObject: closureOrNil)