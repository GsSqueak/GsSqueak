other
buttonName: aString action: aSymbol

	^ SimpleButtonMorph new
		target: self;
		label: aString font: Preferences standardButtonFont;
		actionSelector: aSymbol
