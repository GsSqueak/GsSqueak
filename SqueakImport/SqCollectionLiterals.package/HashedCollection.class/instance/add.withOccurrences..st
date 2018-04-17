adding
add: newObject withOccurrences: anInteger
	"Add newObject anInteger times to the receiver. Do nothing if anInteger is less than one. Answer newObject."
	
	anInteger < 1 ifTrue: [ ^newObject ].
	^self add: newObject "I can only store an object once."
	