testing
directoryExists: filenameOrPath
"if the path is a root,we have to treat it carefully"
	(filenameOrPath endsWith: '$') ifTrue:[^(FileDirectory on: filenameOrPath) exists].
	^(self directoryNamed: filenameOrPath ) exists