preferences
preferredCornerRadius

	<preference: 'Preferred Corner Radius'
		categoryList: #(Morphic windows menus)
		description: 'If a morph wants rounded corners, use this radius. May be overwritten in subclasses.'
		type: #Number>
	^ PreferredCornerRadius ifNil: [6]