preferences
wantsAnnotationPane
	<preference: 'Show annotation pane in the debugger.'
		categoryList: #(debug tools)
		description: 'If true, a small horizontal annotation pane shows information about the selected method.'
		type: #Boolean>
	^ WantsAnnotationPane ifNil: [false]