preferences
indicateKeyboardFocus
	<preference: 'Indicate Keyboard Focus' categoryList: #(#keyboard #Morphic #general) description: 'If enabled, there will be a visual highlight drawn onto the morph to help the user find out about the current keyboard focus. This is especially useful when the keyboard focus does not match the mouse position.' type: #Boolean>
	^ IndicateKeyboardFocus
		ifNil: [false]