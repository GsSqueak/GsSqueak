system startup
shutDown: aboutToQuit 
	Preferences purgeUndoOnQuit ifTrue: [
		aboutToQuit ifTrue: [self resetAllHistory].
	].
