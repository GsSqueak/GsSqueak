preferences
gradientButton
	<preference: 'gradientButton'
		category: 'windows'
		description: 'If true, buttons will have a gradient look.'
		type: #Boolean>
	^ GradientButton ifNil: [ true ]