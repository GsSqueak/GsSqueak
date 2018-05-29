as yet unclassified
startUp
	Preferences automaticPlatformSettings ifFalse: [^ self].

	SoundPlayer soundQuickStart: SoundPlayer defaultQuickStartForPlatform.
	SoundPlayer stopSoundWhenDone: SoundPlayer defaultStopSoundForPlatform.