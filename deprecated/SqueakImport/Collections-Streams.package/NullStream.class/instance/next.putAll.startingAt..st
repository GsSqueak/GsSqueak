writing
next: anInteger putAll: aCollection startingAt: startIndex
	"Store the next anInteger elements from the given collection."

	anInteger > 0 ifFalse: [ ^aCollection ].
	position := position + anInteger.
	^aCollection