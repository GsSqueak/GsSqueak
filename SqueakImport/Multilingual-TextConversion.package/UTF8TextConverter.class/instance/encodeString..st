conversion
encodeString: aString

	| result |
	aString isByteString ifFalse: [ ^super encodeString: aString ].
	result := self class encodeByteString: aString.
	self class latin1Encodings == latin1Encodings ifTrue: [ ^result ].
	^result withLineEndings: (latin1Encodings at: 14)
	