preferences
gradientScrollBar

	<preference: 'gradientScrollBar'
		categoryList: #(windows scrolling)
		description: 'If true, scroll bars will have a gradient look.'
		type: #Boolean>
	^ GradientScrollBar ifNil: [false]