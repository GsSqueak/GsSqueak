preferences
roundedMenuCorners
	<preference: 'roundedMenuCorners' category: #menus description: 'Whether morphic menus should have rounded corners.' type: #Boolean>
	^ RoundedMenuCorners
		ifNil: [true]