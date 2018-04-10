toolbuilder
frameOffsetFromTop: height fromLeft: leftFraction width: rightFraction bottomFraction: bottomFraction 
	^ LayoutFrame new topFraction: 0 offset: height;
		 leftFraction: leftFraction offset: 0;
		 rightFraction: leftFraction + rightFraction offset: 0;
		 bottomFraction: bottomFraction offset: 0;
		 yourself