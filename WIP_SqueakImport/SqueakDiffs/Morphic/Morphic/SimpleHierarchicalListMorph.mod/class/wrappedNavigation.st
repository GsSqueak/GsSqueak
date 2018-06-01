preferences
wrappedNavigation
	<preference: 'Wrapped Tree Navigation'
		category: 'Morphic'
		description: 'When enabled, use of the arrow keys at the top or bottom of a hierarchical list will wrap to the opposite side of the list.'
		type: #Boolean>
	^ WrappedNavigation ifNil: [ false ]