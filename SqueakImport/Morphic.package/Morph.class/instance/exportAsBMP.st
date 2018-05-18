menus
exportAsBMP
	| fName |
	fName := UIManager default saveFilenameRequest:'Please enter the name' translated initialAnswer: self externalName,'.bmp'.
	fName ifNil:[^self].
	self exportAsBMPNamed: fName