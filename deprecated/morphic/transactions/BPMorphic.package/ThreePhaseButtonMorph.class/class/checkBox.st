instance creation
checkBox
	"Answer a button pre-initialized with checkbox images."
	| _gsSqueakTemp_f |
	^ self new onImage: (_gsSqueakTemp_f := MenuIcons checkBoxOnColorized: Color red);
		
		pressedImage: (MenuIcons checkBoxPressedColorized: Color black);
		
		offImage: (MenuIcons checkBoxOffColorized: Color black);
		 extent: _gsSqueakTemp_f extent + (2 @ 0);
		 setDefaultParameters;
		 yourself