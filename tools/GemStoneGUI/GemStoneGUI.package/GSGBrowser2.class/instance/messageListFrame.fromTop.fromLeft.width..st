toolbuilder - layouting
messageListFrame: bottomFraction fromTop: topFraction fromLeft: leftFraction width: width

	| displacement |
	displacement := self environmentIdListWidth // 4.
	^ LayoutFrame new
		leftFraction: leftFraction offset: displacement;
		topFraction: topFraction offset: 0;
		rightFraction: (leftFraction + width) offset: 0;
		bottomFraction: bottomFraction offset: self buttonHeight negated