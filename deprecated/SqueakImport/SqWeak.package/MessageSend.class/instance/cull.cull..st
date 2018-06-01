evaluating
cull: firstArg cull: secondArg
	"Send the message with these optional arguments and answer the return value"

	| numArgs |
	(numArgs := selector numArgs) >= 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value