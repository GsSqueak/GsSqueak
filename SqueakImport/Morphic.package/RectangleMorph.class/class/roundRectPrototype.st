as yet unclassified
roundRectPrototype
	"Answer a prototypical RoundRect object for a parts bin."

	^ self authoringPrototype useRoundedCorners 
		color: (Color r: 1.0 g: 0.3 b: 0.6); 
		borderWidth: 1;
		setNameTo: 'RoundRect'