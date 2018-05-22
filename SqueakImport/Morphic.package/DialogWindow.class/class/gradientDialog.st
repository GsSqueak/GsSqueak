preferences
gradientDialog

	<preference: 'gradientDialog'
		category: 'dialogs'
		description: 'If true, dialogs will have a gradient look.'
		type: #Boolean>
	^ GradientDialog ifNil: [true]
