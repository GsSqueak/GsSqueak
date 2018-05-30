toolbuilder
selectorListFrame: max fromTop: topOffset
	^LayoutFrame new
		leftFraction: 0 offset: 0;
		topFraction: 0 offset: topOffset;
		rightFraction: 0.5 offset: 0;
		bottomFraction: max offset: 0.