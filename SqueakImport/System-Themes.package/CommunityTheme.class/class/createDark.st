instance creation
createDark
	"self createDark apply."
	| name |
	name := 'Community (dark)'.
	^ (self named: name) in: [:theme |
		theme merge: (self named: 'Squeak') overwrite: true.
		theme name: name.
		"General morph stuff."
		theme
			set: #borderColor for: #ScrollPane to: (Color transparent) ;
			set: #keyboardFocusColor for: #Morph to: (self dbSelection adjustSaturation: -0.3 brightness: 0.10);
			set: #keyboardFocusWidth for: #Morph to: 2;
			set: #softShadowColor for: #Morph to: (self dbSelection muchLighter alpha: 0.025);
			set: #softShadowOffset for: #Morph to: (10@8 corner: 10@12);
			set: #hardShadowColor for: #Morph to: (self dbSelection muchLighter alpha: 0.02);
			set: #hardShadowOffset for: #Morph to: 1@1.
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