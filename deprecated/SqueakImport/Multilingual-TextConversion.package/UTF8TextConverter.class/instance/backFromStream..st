conversion
backFromStream: aStream

	aStream position = 0 ifTrue: [ ^nil ].
	aStream isBinary ifTrue: [ ^aStream basicBack ].
	[ aStream position = 0 or: [ 
		(aStream basicBack asciiValue bitXor: 128) >= 64 ] ] whileFalse.
	^aStream peek