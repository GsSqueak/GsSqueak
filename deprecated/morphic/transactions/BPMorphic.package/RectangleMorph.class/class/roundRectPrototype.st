as yet unclassified
roundRectPrototype
	^ self authoringPrototype useRoundedCorners
		color: ((Color
				r: 1.0
				g: 0.3
				b: 0.6)
				alpha: 0.5);
		 borderWidth: 1;
		 setNameTo: 'RoundRect'