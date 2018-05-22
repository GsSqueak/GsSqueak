icons
importImageDirectoryWithSubdirectories: directoryOrName 
	| dir forms |
	dir := directoryOrName isString
		ifFalse: [ directoryOrName ]
		ifTrue: [ FileDirectory default directoryNamed: directoryOrName ].
	dir exists
		ifFalse: [self error: dir fullName , ' does not exist'. ^ #()].
	forms := OrderedCollection new.
	dir withAllSubdirectoriesCollect: [ :subdir | forms addAll: (self importImageDirectory: dir) ].
	^ forms