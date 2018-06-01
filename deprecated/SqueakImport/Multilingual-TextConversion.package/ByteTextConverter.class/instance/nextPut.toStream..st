conversion
nextPut: aCharacter toStream: aStream
	
	| charCode |
	aStream isBinary ifTrue: [ ^aCharacter storeBinaryOn: aStream ].
	(charCode := aCharacter charCode) < 256 
		ifFalse: [ aStream basicNextPut: (Character value: (self encode: charCode)) ]
		ifTrue: [
			(latin1Map at: charCode + 1) = 1 
				ifFalse: [aStream basicNextPut: aCharacter]
				ifTrue: [(latin1Encodings at: charCode + 1)
							ifNil: [ UndefinedConversion signalFor: charCode toEncoding: self]
							ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ] ] ].
	^aCharacter