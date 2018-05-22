standard file operations
oldFileStreamFrom: aDirectory

	| sfmResult fileStream |
	sfmResult := self oldFileFrom: aDirectory.
	sfmResult ifNil: [^nil].
	fileStream := sfmResult directory oldFileNamed: sfmResult name.
	[fileStream isNil] whileTrue:
		[sfmResult := self oldFileFrom: aDirectory.
		sfmResult ifNil: [^nil].
		fileStream := sfmResult directory oldFileNamed: sfmResult name].
	^fileStream
