preferences
menuBoxFrame
	^ MenuBoxFrame
		ifNil: [MenuBoxFrame := LayoutFrame new leftFraction: 0;
						 leftOffset: self boxExtent x + 3;
						 topFraction: 0;
						 topOffset: 0;
						 yourself]