preferences
showMessageIcons
	<preference: 'Show message icons'
		category: 'browsing'
		description: 'When enabled, the message list will show icons for flags, overrides, etc.'
		type: #Boolean>
	^ShowMessageIcons ifNil: [true]
