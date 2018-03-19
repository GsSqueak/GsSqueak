preferences
closeBoxFrame
	^ CloseBoxFrame
		ifNil: [CloseBoxFrame := LayoutFrame new leftFraction: 0;
						 leftOffset: 2;
						 topFraction: 0;
						 topOffset: 0;
						 yourself]