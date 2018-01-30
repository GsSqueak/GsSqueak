menus
exportAsBMP
	| fName |
	fName := UIManager default request: 'Please enter the name' translated initialAnswer: self externalName , '.bmp'.
	fName isEmpty
		ifTrue: [^ self].
	self exportAsBMPNamed: fName