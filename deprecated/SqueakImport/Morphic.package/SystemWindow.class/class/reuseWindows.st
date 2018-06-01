preferences
reuseWindows

	<preference: 'Reuse Windows'
		category: 'browsing'
		description: 'When enabled, before opening a new window check if there is any open window like it, and if there is, reuse it.'
		type: #Boolean>
	^ReuseWindows ifNil: [ false ]
