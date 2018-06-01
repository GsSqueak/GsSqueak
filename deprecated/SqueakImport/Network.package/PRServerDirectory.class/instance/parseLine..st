private
parseLine: aString 
"private - parse a line from a server response"
	| tokens |
	tokens := aString findTokens: '|'.
	""
	^ tokens first = 'D'
		ifTrue: 
			[ DirectoryEntryDirectory
				directory: self
				name: tokens second
				creationTime: 0
				modificationTime: 0
				fileSize: 0 ]
		ifFalse: 
			[ DirectoryEntryFile
				directory: self
				name: tokens second
				creationTime: tokens third asInteger
				modificationTime: tokens fourth asInteger
				fileSize: tokens fifth asInteger ]