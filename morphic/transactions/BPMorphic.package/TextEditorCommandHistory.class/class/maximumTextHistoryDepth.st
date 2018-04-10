preferences
maximumTextHistoryDepth
	<preference: 'Maximum text edit (undo/redo) history depth' categoryList: #(#editing #Morphic) description: 'Specifies the number of editor commands that will be stored in a text editor' type: #Number>
	^ MaximumTextHistoryDepth
		ifNil: [500]