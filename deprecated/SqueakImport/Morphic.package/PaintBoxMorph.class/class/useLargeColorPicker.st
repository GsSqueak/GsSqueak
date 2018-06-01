preferences
useLargeColorPicker
	<preference: 'Use large color picker'
	category: 'Morphic'
	description: 'If true, then the color picker of the paint box will be large and 32bits deep.'
	type: #Boolean>
	^UseLargeColorPicker ifNil: [ false ]