preferences
slideDismissalsToTrash
	<preference: 'Slide dismissals to trash' category: 'morphic' description: 'If true, when you dismiss a Morph it will slide to the TrashCan.' type: #Boolean>
	^ SlideDismissalsToTrash ifNil: [false].