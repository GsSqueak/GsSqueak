menu
saveToDisk: evt
	| newName |
	newName := UIManager default saveFilenameRequest: 'Please confirm name for save...'
						initialAnswer: soundName, '.fmp'.
	newName isEmptyOrNil ifTrue: [^ self].
	FileStream newFileNamed: newName
		do:[:f| sound storeOn: f]