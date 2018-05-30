running
startUp

	Preferences eToyLoginEnabled
		ifTrue: [self doEtoyLogin]
		ifFalse:[self startUpAfterLogin].