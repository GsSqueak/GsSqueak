conversion
backFromStream: aStream

	aStream position = 0 ifTrue: [ ^nil ].
	aStream isBinary ifTrue: [ ^aStream basicBack ].
	^self toSqueak: aStream basicBack