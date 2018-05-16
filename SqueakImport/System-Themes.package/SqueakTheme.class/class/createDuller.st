instance creation
createDuller
	"self createDuller apply"
	
	| name |
	name := 'Squeak (duller)'.
	^ (self named:name) in: [:theme |
		theme merge: (self named: 'Squeak') overwrite: true.
		theme name: name.
		self
			addDullerWindowColors: theme;
			addDullerScrollables: theme;
			addDullerDialogs: theme;
			addDullerMenusAndDockingBars: theme;
			addDullerButtons: theme;
			addDullerToolColors: theme.
			
		theme set: #color for: #TextAction to: Color ocean.
		
		theme]