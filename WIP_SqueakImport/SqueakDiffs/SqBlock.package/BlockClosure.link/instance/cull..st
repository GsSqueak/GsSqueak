evaluating
cull: firstArg
	"Activate the receiver, with one or zero arguments."
	
	self numArgs >= 1 ifTrue: [ ^self value: firstArg ].
	^self value

