*SqCollectionLiterals-*SqCollectionLiterals-adding
add: newObject withOccurrences: anInteger
	"Add newObject anInteger times to the receiver. Do nothing if anInteger is less than one. Answer newObject."

	anInteger timesRepeat: [self add: newObject].
	^ newObject
