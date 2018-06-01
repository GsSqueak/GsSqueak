preferences
smartVerticalSplitters
	<preference: 'Smart Vertical Splitters'
		category: 'Morphic'
		description: 'When true, vertical bars between lists will automatically reposition themselves to balance the number of characters occluded on either side of the bar.'
		type: #Boolean>
	^ SmartVerticalSplitters ifNil: [ false ]