-Etoys-support
enforceTileColorPolicy
	(Preferences valueOfFlag: #coloredTilesEnabled)
		ifTrue: [self makeAllTilesColored]
		ifFalse: [self makeAllTilesGreen]