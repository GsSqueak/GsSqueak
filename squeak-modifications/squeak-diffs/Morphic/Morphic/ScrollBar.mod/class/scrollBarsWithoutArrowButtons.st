preferences
scrollBarsWithoutArrowButtons

	<preference: 'scrollBarsWithoutArrowButtons'
		category: #scrolling
		description: 'If true, morphic scrollbars will not include arrow buttons but only the slider.'
		type: #Boolean>
	^ ScrollBarsWithoutArrowButtons ifNil: [false]