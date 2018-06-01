conversion
nextPut: aCharacter toStream: aStream

	| charCode |
	aStream isBinary ifTrue: [ ^aCharacter storeBinaryOn: aStream ].
	(useByteOrderMark and: [ byteOrderMarkDone not ]) ifTrue: [
		self next32BitValue: 16r0000FEFF toStream: aStream.
		byteOrderMarkDone := true ].
	(charCode := aCharacter charCode) < 256
		ifTrue: [
			(latin1Encodings at: charCode + 1)
				ifNil: [ self next32BitValue: charCode toStream: aStream ]
				ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ] ]
		ifFalse: [
			self next32BitValue: charCode toStream: aStream ].
	^aCharacter