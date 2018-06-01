conversion
decodeString: aString

	| result |
	result := String new: aString size streamContents: [ :stream |
		| readStream character |
		readStream := aString readStream.
		[ (character := self nextFromStream: readStream) == nil ]
			whileFalse: [ stream nextPut: character ] ].
	self class latin1Encodings == latin1Encodings ifTrue: [ ^result ].
	^result withSqueakLineEndings