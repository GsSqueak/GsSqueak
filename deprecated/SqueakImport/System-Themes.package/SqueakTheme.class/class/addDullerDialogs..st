instance creation
addDullerDialogs: theme
	"self createDuller apply."
	
	theme
		set: #titleColor for: #DialogWindow to: (Color r: 0.658 g: 0.678 b: 0.78) duller;
		set: #okColor for: #DialogWindow to: (Color r: 0.49 g: 0.749 b: 0.49) duller;
		set: #cancelColor for: #DialogWindow to: (Color r: 1 g: 0.6 b: 0.588) duller;
		set: #buttonColor for: #DialogWindow to: (Color r: 0.658 g: 0.678 b: 0.78) twiceLighter duller;
		set: #selectionModifier for: #DialogWindow to: [ [:c | Color orange duller ] ].
	
	"The List Chooser is a dialog, too."
	theme
		set: #addColor for: #ListChooser to: Color ocean;
		set: #disabledColor for: #ListChooser to: Color gray duller.
		
	"And the system progress bar."
	theme
		set: #color for: #SystemProgressBarMorph to: (Color r: 0.977 g: 0.977 b: 0.977) duller;
		set: #barColor for: #SystemProgressBarMorph to: (Color r: 0.72 g: 0.72 b: 0.9) duller.
		
	"And the balloon morphs."
	theme
		set: #borderColor for: #NewBalloonMorph to: (Color r: 0.46 g: 0.46 b: 0.353) duller;
		set: #color for: #NewBalloonMorph to:(Color r: 0.92 g: 0.92 b: 0.706) duller.