new flap
askForEdgeOfNewFlap

	
	^MenuMorph 
		chooseFrom: (#('left' 'right' 'top' 'bottom') collect: [ :each | each translated ])
		values: #(left right top bottom)
		lines: #()
		title: 'Where should the new flap cling?' translated.
