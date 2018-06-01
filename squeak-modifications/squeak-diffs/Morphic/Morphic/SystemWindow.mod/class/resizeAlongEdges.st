preferences
resizeAlongEdges
	<preference: 'Resize Windows along edges'
		category: 'Morphic'
		description: 'When true, windows can be resized along their edges as well as the corners'
		type: #Boolean>
	^ResizeAlongEdges ifNil:[true]