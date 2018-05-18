preferences
visualWrapBorder
	<preference: 'Show wrap border in code panes.'
		categoryList: #(editing visuals performance)
		description: 'Show a visual border after a specific amount of characters. Makes sense for monospaced fonts.'
		type: #Boolean>
	^ VisualWrapBorder ifNil: [false]