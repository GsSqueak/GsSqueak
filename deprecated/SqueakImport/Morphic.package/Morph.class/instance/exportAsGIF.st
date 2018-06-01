menus
exportAsGIF
	| fName |
	fName := UIManager default saveFilenameRequest:'Please enter the name' translated initialAnswer: self externalName,'.gif'.
	fName ifNil:[^self].
	self exportAsGIFNamed: fName