preferences
showContentsInColumns
	<preference: 'Use columns in object explorer'
		categoryList: #(Tools exploring)
		description: 'If enabled, the object explorer will show key in the first column and values in the second column.'
		type: #Boolean>
	^ ShowContentsInColumns ifNil: [true]