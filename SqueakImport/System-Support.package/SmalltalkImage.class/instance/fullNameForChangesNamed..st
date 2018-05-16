image, changes names
fullNameForChangesNamed: aName
	| imgName |
	imgName := self fullNameForImageNamed: aName.
	^FileDirectory fileName: (FileDirectory baseNameFor: imgName) extension: FileDirectory changeSuffix.