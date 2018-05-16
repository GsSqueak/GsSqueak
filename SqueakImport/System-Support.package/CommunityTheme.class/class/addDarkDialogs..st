instance creation
addDarkDialogs: aUserInterfaceTheme
	"self createDark apply."
	aUserInterfaceTheme
		set: #borderColor for: #DialogWindow to: self dbSelection;
		set: #color for: #DialogWindow to: (self dbBlue adjustSaturation: -0.20 brightness: -0.30);

		set: #titleColor for: #DialogWindow to: self dbBlue twiceDarker;
		set: #titleTextColor for: #DialogWindow to: Color veryLightGray;

		set: #textColor for: #DialogWindow to: (Color gray: 0.9);

		set: #okColor for: #DialogWindow to: self dbGreen;
		set: #cancelColor for: #DialogWindow to: self dbOrange;
		set: #buttonColor for: #DialogWindow to: Color darkGray;
		set: #selectionModifier for: #DialogWindow to: [ [:c | self dbSelection twiceDarker ] ].
	"The List Chooser is a dialog, too."
	aUserInterfaceTheme
		set: #addColor for: #ListChooser to: self dbBlue;
		set: #disabledColor for: #ListChooser to: Color transparent.
	"And the system progress bar."
	aUserInterfaceTheme
		set: #color for: #SystemProgressBarMorph to: Color transparent;
		set: #barColor for: #SystemProgressBarMorph to: self dbSelection.
	"And the balloon morphs."
	aUserInterfaceTheme
		set: #borderColor for: #NewBalloonMorph to: Color transparent ;
		set: #color for: #NewBalloonMorph to: (self dbOrange twiceDarker alpha: 0.9) ;
		set: #textColor for: #NewBalloonMorph to: Color white .