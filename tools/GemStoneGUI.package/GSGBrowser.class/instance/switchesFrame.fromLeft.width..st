toolbuilder - layouting
switchesFrame: bottomFraction fromLeft: leftFraction width: rightFraction

	^ LayoutFrame new
		leftFraction: leftFraction offset: 0;
		topFraction: bottomFraction offset: self buttonHeight negated;
		rightFraction: (leftFraction + rightFraction) offset: 0;
		bottomFraction: bottomFraction offset: 0