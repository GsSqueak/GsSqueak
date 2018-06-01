printing
printOn: aStream
	| arrow |
	super printOn: aStream.
	"If the key is a binary selector and we don't use whitespace, we will stream (key, '->') asSymbol."
	arrow := (key isSymbol and: [key isBinary]) ifTrue: [' -> '] ifFalse: ['->'].
	aStream nextPutAll: arrow.
	value printOn: aStream