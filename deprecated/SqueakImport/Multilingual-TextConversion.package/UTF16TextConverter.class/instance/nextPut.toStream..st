conversion
nextPut: aCharacter toStream: aStream

	| charCode |
	aStream isBinary ifTrue: [ ^aCharacter storeBinaryOn: aStream ].
	(useByteOrderMark and: [ byteOrderMarkDone not ]) ifTrue: [
		self next16BitValue: 16rFEFF toStream: aStream.
		byteOrderMarkDone := true ].
	(charCode := aCharacter charCode) < 256
		ifTrue: [
			(latin1Encodings at: charCode + 1)
				ifNil: [ self next16BitValue: charCode toStream: aStream ]
				ifNotNil: [ :encodedString | aStream basicNextPutAll: encodedString ] ]
		ifFalse: [
			charCode <= 16rFFFF
				ifTrue: [ self next16BitValue: charCode toStream: aStream ]
				ifFalse: [
					| low high |
					charCode := charCode - 16r10000.
					low := charCode \\ 16r400 + 16rDC00.
					high := charCode // 16r400 + 16rD800.
					self
						next16BitValue: high toStream: aStream;
						next16BitValue: low toStream: aStream ] ].
	^aCharacter