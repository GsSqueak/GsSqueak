instance creation
createDark
	"doIt: [self createDark apply.]"

	| themeName |
	themeName := 'Solarized (dark)'.
	^ (self named: themeName) in: [:theme |
		theme merge: (self named: 'Squeak') overwrite: true.
		theme name: themeName.

		"General morph stuff."
		theme
			set: #keyboardFocusColor for: #Morph to: self darkContentSecondary;
			set: #keyboardFocusWidth for: #Morph to: 1.

		theme set: #background for: #MorphicProject to: self lightBackgroundForm.

		self
			addDarkFonts: theme;
			addDarkWindowColors: theme;
			addDarkSyntaxHighlighting: theme;
			addDarkScrollables: theme;
			addDarkButtons: theme;
			addDarkDialogs: theme;
			addDarkMenusAndDockingBars: theme;
			addDarkToolColors: theme.

		theme]