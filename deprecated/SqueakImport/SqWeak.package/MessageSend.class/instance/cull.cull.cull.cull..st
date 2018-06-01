evaluating
cull: firstArg cull: secondArg cull: thirdArg cull: fourthArg
	"Send the message with these optional arguments and answer the return value"

	| numArgs |
	(numArgs := selector numArgs) >= 3 ifTrue: [
		numArgs >= 4 ifTrue: [
			^self value: firstArg value: secondArg value: thirdArg value: fourthArg ].
		^self value: firstArg value: secondArg value: thirdArg ].
	numArgs = 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value