preferences
maxLengthForASingleDebugLogReport
	<preference: 'Max. Debug Report Length'
		category: 'debug'
		description: 'The description of an Exception stack will be truncated so as to not exceed this value'
		type: #Number>
	^MaxLengthForASingleDebugLogReport ifNil: [40000]