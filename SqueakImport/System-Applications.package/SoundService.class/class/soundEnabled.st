preferences
soundEnabled
	<preference: 'Enable sound'
		category: 'media'
		description: 'If false, all sound playing is disabled'
		type: #Boolean>
	^SoundEnabled ifNil: [true]