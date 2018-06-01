evaluating
cull: firstArg
	"Send the message with these optional arguments and answer the return value"

	selector numArgs >= 1 ifTrue: [ ^self value: firstArg ].
	^self value