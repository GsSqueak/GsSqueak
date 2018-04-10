instance creation
radioButton
	"Answer a button pre-initialized with radiobutton images."
	| _gsSqueakTemp_f |
	^ self new onImage: (_gsSqueakTemp_f := MenuIcons radioButtonOnColorized: Color black);
		
		pressedImage: (MenuIcons radioButtonPressedColorized: Color black);
		
		offImage: (MenuIcons radioButtonOffColorized: Color black);
		 extent: _gsSqueakTemp_f extent + (2 @ 0);
		 setDefaultParameters;
		 yourself