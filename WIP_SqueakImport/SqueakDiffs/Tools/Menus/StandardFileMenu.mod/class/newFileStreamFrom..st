standard file operations
newFileStreamFrom: aDirectory

	| sfmResult fileStream |
	sfmResult := self newFileFrom: aDirectory.
	sfmResult ifNil: [^nil].
	fileStream := sfmResult directory newFileNamed: sfmResult name.
	[fileStream isNil] whileTrue:
		[sfmResult := self newFileFrom: aDirectory.
		sfmResult ifNil: [^nil].
		fileStream := sfmResult directory newFileNamed: sfmResult name].
	^fileStream
