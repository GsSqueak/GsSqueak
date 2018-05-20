deserialization
deserializeSpecialObject: aStream

	| nextChar |
	nextChar := aStream peek.
	nextChar = $n ifTrue: [^ self deserializeNil: aStream].
	nextChar = $t ifTrue: [^ self deserializeTrue: aStream].
	nextChar = $f ifTrue: [^ self deserializeFalse: aStream].	
	self error: 'Could not read special object'