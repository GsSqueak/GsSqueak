file string
fileString: aString

	"| textName index ending |
	textName := aString asString.
	(FileDirectory default fileExists: textName) ifTrue:
		[self directory: (FileDirectory forFileName: textName).
		 index := list indexOf: (FileDirectory localNameFor: textName).
		 index = 0 ifTrue: 
			[ending := ') ', (FileDirectory localNameFor: textName).
		  	 index := list findFirst: [:line | line endsWith: ending]].
		 self fileListIndex: index].
	(FileDirectory default directoryExists: textName) ifTrue:
		[self directory: (FileDirectory on: textName)]."
	self changed: #fileString.
	self changed: #contents.
	^true