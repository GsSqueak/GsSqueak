menus
exportAsPNG
	| fName |
	fName := UIManager default saveFilenameRequest:'Please enter the name' translated initialAnswer: self externalName,'.png'.
	fName ifNil:[^self].
	self exportAsPNGNamed: fName