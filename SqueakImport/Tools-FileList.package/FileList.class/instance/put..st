private
put: aText
	"Private - put the supplied text onto the file"

	| ff type newName |
	brevityState == #fullFile ifTrue:
		[ff := directory newFileNamed: self fullName.
		Cursor write showWhile: [ff nextPutAll: aText asString; close].
		(directory = ff directory and: [fileName = ff localName])
			ifTrue: [contents := aText asString]
			ifFalse: 		"user changed the directory and/or renamed the file"
				[self clearUserEditFlag.
				directory ~= ff directory ifTrue: 
					[self directory: ff directory.
					self changed: #rootDirectoryList; changed: #selectedPath].
				self updateFileList.
				contents := aText asString.
				newName := ff localName.
				listIndex := list findFirst: [:item | (self fileNameFromFormattedItem: item) = newName].
				listIndex > 0 ifTrue: [fileName := newName].
				brevityState := #needToGetBrief.
				self changed: #fileListIndex].
		self changed: #relabel.
		^ true  "accepted"].

	listIndex = 0 ifTrue:
		[self inform: 'No fileName is selected' translated.
		^ false  "failed"].
	type := 'These'.
	brevityState = #briefFile ifTrue: [type := 'Abbreviated'].
	brevityState = #briefHex ifTrue: [type := 'Abbreviated'].
	brevityState = #fullHex ifTrue: [type := 'Hexadecimal'].
	brevityState = #FileList ifTrue: [type := 'Directory'].
	self inform: ('{1} contents cannot
meaningfully be saved at present.' translated format:{type translated}).
	^ false  "failed"
