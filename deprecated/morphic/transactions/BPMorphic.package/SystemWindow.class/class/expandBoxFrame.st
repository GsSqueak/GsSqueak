preferences
expandBoxFrame
	^ ExpandBoxFrame
		ifNil: [ExpandBoxFrame := LayoutFrame new leftFraction: 1;
						 leftOffset: (self boxExtent x * 2 + 3) negated;
						 topFraction: 0;
						 topOffset: 0;
						 yourself]