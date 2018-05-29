accessing
canRecordWhilePlaying
	"Return true if this platform supports simultaneous sound recording and playback."
	<preference: 'Record while playing'
		category: 'media'
		description: 'If true, recording and playing sounds concurrently is permitted (platform dependent)'
		type: #Boolean>
	^CanRecordWhilePlaying ifNil: [false].	
