directory tree
subDirectoriesOf: aDirectory
	^aDirectory directoryNames collect:[:each| aDirectory directoryNamed: each].