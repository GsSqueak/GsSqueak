preferences
draggableTextSelection

	<preference: 'Draggable Text Selections'
		categoryList: #(editing mouse Morphic)
		description: 'Whether you can drag-and-drop selections in text morphs.'
		type: #Boolean>
		
	^ DraggableTextSelection ifNil: [false]