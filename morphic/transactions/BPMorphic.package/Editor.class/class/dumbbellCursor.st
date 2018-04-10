preferences
dumbbellCursor
	<preference: 'Dumbbell-shaped Text Cursor' category: 'Morphic' description: 'When true, the text cursor assumes the shape of a dumbbell, otherwise a vertical bar..' type: #Boolean>
	^ DumbbellCursor
		ifNil: [false]