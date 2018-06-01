instance creation
addDarkDialogs: theme
	"self createDark apply."
	theme
		set: #borderColor for: #DialogWindow to: self backgroundColor muchDarker;
		set: #color for: #DialogWindow to: self invisibleColor;

		set: #titleColor for: #DialogWindow to: self backgroundColor;
		set: #titleTextColor for: #DialogWindow to: self foregroundColor;
		
		set: #textColor for: #DialogWindow to: self yellow;
		
		set: #okColor for: #DialogWindow to: self green muchDarker;
		set: #cancelColor for: #DialogWindow to: self orange muchDarker;
		set: #buttonColor for: #DialogWindow to: self invisibleColor;
		set: #selectionModifier for: #DialogWindow to: [ [:c | c adjustBrightness: -0.1 ] ].
	
	"The List Chooser is a dialog, too."
	theme
		set: #addColor for: #ListChooser to: self blue;
		set: #disabledColor for: #ListChooser to: Color transparent.

		
	"And the system progress bar."
	theme
		set: #color for: #SystemProgressBarMorph to: self invisibleColor;
		set: #barColor for: #SystemProgressBarMorph to: self foregroundColor.
		
	"And the balloon morphs."
	theme
		set: #borderColor for: #NewBalloonMorph to: self backgroundColor muchDarker;
		set: #color for: #NewBalloonMorph to: self invisibleColor.