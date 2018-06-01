instance creation
fromGIFFileNamed: fileName
	| reader |
	reader := AnimatedGIFReadWriter formsFromFileNamed: fileName.
	^reader forms size = 1
		ifTrue: [ ImageMorph new image: reader forms first ]
		ifFalse: [ self new fromReader: reader ]