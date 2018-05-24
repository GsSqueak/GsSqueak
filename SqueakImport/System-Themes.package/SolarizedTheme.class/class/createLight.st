instance creation
createLight
	"You have to create dark first.
	doIt: [self createDark. self createLight apply.]"

	| themeName |
	themeName := 'Solarized (light)'.
	^ (self named: themeName) in: [:theme |
		theme merge: (self named: 'Solarized (dark)') overwrite: true.
		theme name: themeName.

		"General morph stuff."
		theme
			set: #keyboardFocusColor for: #Morph to: self lightContentSecondary;
			set: #keyboardFocusWidth for: #Morph to: 1.

		theme set: #background for: #MorphicProject to: self darkBackgroundForm.

		self
			addLightFonts: theme;
			addLightWindowColors: theme;
			addLightSyntaxHighlighting: theme;
			addLightScrollables: theme;
			addLightButtons: theme;
			addLightDialogs: theme;
			addLightMenusAndDockingBars: theme;
			addLightToolColors: theme.

		theme]