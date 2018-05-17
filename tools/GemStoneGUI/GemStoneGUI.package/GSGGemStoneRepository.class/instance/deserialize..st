deserialization - new
deserialize: aStream

	| nextChar |
	nextChar := aStream peek.
	nextChar = $# ifTrue: [^ self deserializeSymbol: aStream].
	nextChar = $' ifTrue: [^ self deserializeString: aStream].
	nextChar = $[ ifTrue: [^ self deserializeComposite: aStream].
	nextChar isDigit ifTrue: [^ self deserializeNumber: aStream].
	^ self deserializePrimitive: aStream