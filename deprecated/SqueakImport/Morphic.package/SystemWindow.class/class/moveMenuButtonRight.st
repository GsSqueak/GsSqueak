preferences
moveMenuButtonRight

	<preference: 'Move Menu Button Right'
		category: 'windows'
		description: 'Moves the menu to the right side of the window label area, while traditionally it used to be on the left side'
		type: #Boolean>
	^ self menuBoxFrame leftOffset negative
