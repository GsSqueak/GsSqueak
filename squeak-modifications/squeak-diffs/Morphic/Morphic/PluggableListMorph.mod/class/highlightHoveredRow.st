preferences
highlightHoveredRow

	<preference: 'Highlight Hovered Row in Lists'
		category: #Morphic
		description: 'Indicate which row will be affected before any further interaction takes place.'
		type: #Boolean>
	^ HighlightHoveredRow ifNil: [true]