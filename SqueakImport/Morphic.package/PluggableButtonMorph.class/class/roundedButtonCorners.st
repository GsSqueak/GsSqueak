preferences
roundedButtonCorners
	<preference: 'Rounded Button Corners'
		category: 'windows'
		description: 'If true, pluggable buttons in system windows will be rounded'
		type: #Boolean>
	^ RoundedButtonCorners ifNil: [ true ]