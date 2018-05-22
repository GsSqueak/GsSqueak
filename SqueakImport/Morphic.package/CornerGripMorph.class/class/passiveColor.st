handle settings
passiveColor
	<preference: 'Corner Grip color'
		category: 'colors'
		description: 'The default color of window corners'
		type: #Color>
	^(self passiveForm colorAt: 24@24) alpha:  1