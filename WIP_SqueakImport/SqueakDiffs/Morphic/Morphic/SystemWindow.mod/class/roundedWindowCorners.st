preferences
roundedWindowCorners

	<preference: 'Rounded Window Corners'
		category: 'windows'
		description: 'If true, windows will have rounded corners.'
		type: #Boolean>
	^ RoundedWindowCorners ifNil: [false]