preferences
maxStackDepthForASingleDebugLogReport
	<preference: 'Max. Debug Report Stack Depth'
		category: 'debug'
		description: 'In an exception stack, any sender deeper than this value will not be logged.'
		type: #Number>
	^MaxStackDepthForASingleDebugLogReport ifNil: [60]