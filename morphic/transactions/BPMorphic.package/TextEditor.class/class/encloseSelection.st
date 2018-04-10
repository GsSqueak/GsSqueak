preferences
encloseSelection
	<preference: 'Enclose selection with brackets () {} [] '''' "" || <>' categoryList: #('Morphic' 'editing') description: 'When true, selecting text and typing an opening parenthesis, bracket, square-bracket, single quote, or double quote will add corresponding character around the selection without requiring a cmd key.' type: #Boolean>
	^ EncloseSelection
		ifNil: [false]