public query
defaultFileNameConverter
	Smalltalk platformName = 'Win32' ifTrue:[^UTF8TextConverter new].
	FileNameConverterClass
		ifNil: [FileNameConverterClass := self currentPlatform class fileNameConverterClass].
	^ FileNameConverterClass new