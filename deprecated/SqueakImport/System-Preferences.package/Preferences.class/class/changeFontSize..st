prefs - fonts
changeFontSize: delta
	| theme base fonts |
	delta = 0 ifTrue: [self restoreDefaultFonts].
	(UserInterfaceTheme current name beginsWith: 'Demo')
		ifFalse: [
			"Create DEMO version of current theme."
			theme := UserInterfaceTheme named: 'Demo'.
			theme merge: UserInterfaceTheme current overwrite: true.
			theme apply].

	base := (TextStyle defaultFont name beginsWith: 'Darkmap')
		ifTrue: ['Darkmap DejaVu Sans'] ifFalse: ['Bitmap DejaVu Sans'].

	fonts := {
		{#SystemFont. base}.
		{#FixedFont. 'BitstreamVeraSansMono'}.
		{#ListFont. base}.
		{#FlapFont. base}.
		{#EToysFont. base}.
		{#PaintBoxButtonFont. base}.
		{#MenuFont. base}.
		{#WindowTitleFont. base, ' B'}.
		{#BalloonHelpFont. base}.
		{#CodeFont. base}.
		{#ButtonFont. base}.
	} collect: [:ary || newPtSize |
		newPtSize := (self perform: ('standard', ary first) asSymbol) pointSize + delta.
		{('set', ary first, 'To:') asSymbol. ary second. newPtSize}
	].
	self setDefaultFonts: fonts.
