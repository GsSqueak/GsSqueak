menus
exportAsJPEG
	| fName |
	fName := UIManager default saveFilenameRequest: 'Please enter the name' translated initialAnswer: self externalName,'.jpeg'.
	fName ifNil: [^ self].
	self exportAsJPEGNamed: fName