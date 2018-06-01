preferences
smartHorizontalSplitters
	<preference: 'Smart Horizontal Splitters'
		category: 'Morphic'
		description: 'When true, horizontal splitter bars will automatically reposition themselves to increase the quantity of exposed information, if possible..'
		type: #Boolean>
	^ SmartHorizontalSplitters ifNil: [ false ]