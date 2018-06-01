preferences
gradientWindow

	<preference: 'gradientWindow'
		category: 'windows'
		description: 'If true, windows will have a gradient look.'
		type: #Boolean>
	^ GradientWindow ifNil: [true]
