preferences
stopSoundWhenDone
		<preference: 'Stop sounds when done'
		category: 'media'
		description: 'If true, the sound player is shut down after playing finished'
		type: #Boolean>
	
	^SoundsStopWhenDone ifNil: [self defaultStopSoundForPlatform]