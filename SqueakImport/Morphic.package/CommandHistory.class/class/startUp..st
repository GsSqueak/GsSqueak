system startup
startUp: aboutToQuit 
	Preferences purgeUndoOnQuit
		ifTrue: [
			aboutToQuit ifTrue: [self resetAllHistory].
		].
 
	