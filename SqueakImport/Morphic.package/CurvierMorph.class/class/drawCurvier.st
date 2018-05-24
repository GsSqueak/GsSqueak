class initialization
drawCurvier
	<preference: 'Curvier'
		category: 'morphic'
		description: 'If true, closed CurvierMorphs will be smoother and more symmetrical all about. If false they will mimic the old curve shapes with the one sharp bend.'
		type: #Boolean>
	^DrawCurvier ifNil: [true]