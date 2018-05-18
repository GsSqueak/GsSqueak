preferences
dragToEdges
	<preference: 'Drag To Edges'
		category: 'windows'
		description: 'When true, windows snap and resize to corners and edges of the Display.'
		type: #Boolean>
	^DragToEdges ifNil: [false]