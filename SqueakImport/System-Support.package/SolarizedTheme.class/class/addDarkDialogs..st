instance creation
addDarkDialogs: theme
	"self createDark apply."
	theme
		set: #borderColor for: #DialogWindow to: self darkBackground muchDarker;
		set: #color for: #DialogWindow to: self darkBackgroundHighlights;

		set: #titleColor for: #DialogWindow to: self darkBackground;
		set: #titleTextColor for: #DialogWindow to: self darkContentEmphasized;
		
		set: #textColor for: #DialogWindow to: self darkContentEmphasizedMore;
		
		set: #okColor for: #DialogWindow to: self green;
		set: #cancelColor for: #DialogWindow to: self orange;
		set: #buttonColor for: #DialogWindow to: self darkBackgroundHighlights;
		set: #selectionModifier for: #DialogWindow to: [ [:c | c adjustBrightness: -0.1 ] ].
	
	"The List Chooser is a dialog, too."
	theme
		set: #addColor for: #ListChooser to: self blue;
		set: #disabledColor for: #ListChooser to: Color transparent.

		
	"And the system progress bar."
	theme
		set: #color for: #SystemProgressBarMorph to: self darkBackgroundHighlights;
		set: #barColor for: #SystemProgressBarMorph to: self darkContentSecondary.
		
	"And the balloon morphs."
	theme
		set: #borderColor for: #NewBalloonMorph to: self darkBackground muchDarker;
		set: #color for: #NewBalloonMorph to: self darkBackgroundHighlights.