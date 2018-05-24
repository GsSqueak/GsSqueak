instance creation
create
	"This is the default theme for Squeak.
	
	self create apply. "
	
	^ (self named: 'Squeak') in: [:theme |		
		"General morph stuff."
		theme
			set: #keyboardFocusColor for: #Morph to: (TranslucentColor r: 0.3 g: 0.5 b: 0.5 alpha: 0.5);
			set: #keyboardFocusWidth for: #Morph to: 3;
			set: #softShadowColor for: #Morph to: (Color black alpha: 0.01);
			set: #softShadowOffset for: #Morph to: (10@8 corner: 10@12);
			set: #hardShadowColor for: #Morph to: (Color black alpha: 0.5);
			set: #hardShadowOffset for: #Morph to: 1@1.
			
		theme set: #background for: #MorphicProject to: self linenblue.
			
		self
			addFonts: theme;
			addWindowColors: theme;
			addSyntaxHighlighting: theme;
			addMenusAndDockingBars: theme;
			addDialogs: theme;
			addButtons: theme;
			addScrollables: theme;
			addToolColors: theme;
			addMVC: theme.
		
		theme]