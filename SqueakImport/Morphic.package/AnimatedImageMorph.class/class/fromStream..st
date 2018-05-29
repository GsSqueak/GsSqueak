instance creation
fromStream: aStream
	| reader |
	reader := AnimatedGIFReadWriter formsFromStream: aStream.
	^reader forms size = 1
		ifTrue: [ ImageMorph new image: reader forms first ]
		ifFalse: [ self new fromReader: reader ]