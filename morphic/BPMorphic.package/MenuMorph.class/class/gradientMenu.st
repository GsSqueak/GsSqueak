preferences
gradientMenu
	<preference: 'gradientMenu' category: #menus description: 'If true, the menus will have a gradient look.' type: #Boolean>
	^ GradientMenu
		ifNil: [true]