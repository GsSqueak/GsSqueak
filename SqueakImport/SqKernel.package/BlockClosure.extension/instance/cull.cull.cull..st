*SqKernel-evaluating
cull: firstArg cull: secondArg cull: thirdArg
	"Activate the receiver, with three or less arguments."
	
	numArgs >= 2 ifTrue: [ 
		numArgs >= 3 ifTrue: [ ^self value: firstArg value: secondArg value: thirdArg ].
		^self value: firstArg value: secondArg ].
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value

