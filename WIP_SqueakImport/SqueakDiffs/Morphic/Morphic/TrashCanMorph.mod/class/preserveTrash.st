preferences
preserveTrash
	<preference: 'Preserve trash' category: 'morphic' description: 'If true, morphs dismissed via halo or dragged into the Trash will be preserved in the TrashCan for possible future retrieval.' type: #Boolean>
	^ PreserveTrash ifNil: [false].