toolbuilder
footerFrameFromLeft: leftFraction width: widthFraction

	^ LayoutFrame new
		leftFraction: leftFraction offset: 0;
		topFraction: 1 offset: self footerHeight negated;
		rightFraction: (leftFraction + widthFraction) offset: 0;
		bottomFraction: 1 offset: 0