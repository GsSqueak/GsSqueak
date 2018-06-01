preferences
soundQuickStart
		<preference: 'Quickstart Sounds'
		category: 'media'
		description: 'If true, attempt to start playing sounds immediately rather than waiting for the next chance to fill the sound bufffers"'
		type: #Boolean>
	
	^SoundsShouldStartQuick ifNil: [self defaultQuickStartForPlatform]