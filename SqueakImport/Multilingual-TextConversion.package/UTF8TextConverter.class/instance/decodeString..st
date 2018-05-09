conversion
decodeString: aString

	| result |
	aString isByteString ifFalse: [ ^super decodeString: aString ].
	result := self class decodeByteString: aString.
	self class latin1Encodings == latin1Encodings ifTrue: [ ^result ].
	^result withSqueakLineEndings