preferences
roundedScrollBarLook

	<preference: 'roundedScrollBarLook'
		category: #scrolling
		description: 'If true, morphic scrollbars will look rounded.'
		type: #Boolean>
	^ RoundedScrollBarLook ifNil: [false]