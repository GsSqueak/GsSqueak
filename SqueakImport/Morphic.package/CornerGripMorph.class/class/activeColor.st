handle settings
activeColor
	<preference: 'Corner Grip highlight color'
		category: 'colors'
		description: 'The highlight-color of window corners'
		type: #Color>
	^(self activeForm colorAt: 24@24) alpha:  1