instance creation
radioButton
	"Answer a button pre-initialized with radiobutton images."
	| f |
	^self new
		onImage: (f := MenuIcons radioButtonOnColorized: Color black);
		pressedImage: (MenuIcons radioButtonPressedColorized: Color black);
		offImage: (MenuIcons radioButtonOffColorized: Color black);
		extent: f extent + (2@0);
		setDefaultParameters;
		yourself
