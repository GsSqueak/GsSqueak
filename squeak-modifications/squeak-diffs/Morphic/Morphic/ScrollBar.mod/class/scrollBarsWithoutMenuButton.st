preferences
scrollBarsWithoutMenuButton

	<preference: 'scrollBarsWithoutMenuButton'
		category: #scrolling
		description: 'If true, morphic scrollbars will not include a menu button.'
		type: #Boolean>
	^ ScrollBarsWithoutMenuButton ifNil: [false]