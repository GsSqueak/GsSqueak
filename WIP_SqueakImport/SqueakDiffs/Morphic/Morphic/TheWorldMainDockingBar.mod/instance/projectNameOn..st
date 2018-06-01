right side
projectNameOn: aDockingBar
	| morph |
	morph := StringMorph contents: ''.
	morph
		color: (self userInterfaceTheme textColor ifNil: [Color black]);
		font: (self userInterfaceTheme font ifNil: [TextStyle defaultFont]).
	morph setProperty: #projectNameMorph toValue: #projectNameMorph.
	aDockingBar addMorphBack: morph.
	self labelIfNeeded: aDockingBar