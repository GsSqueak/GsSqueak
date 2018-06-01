instance creation
checkBox
	"Answer a button pre-initialized with checkbox images."
	| f |
	^self new
		onImage: (f := MenuIcons checkBoxOnColorized: Color red);
		pressedImage: (MenuIcons checkBoxPressedColorized: Color black);
		offImage: (MenuIcons checkBoxOffColorized: Color black);
		extent: f extent + (2@0);
		setDefaultParameters;
		yourself
