toolbuilder - layouting
messageCategoryListFrame: bottomFraction fromTop: topFraction fromLeft: leftFraction width: width

	| displacement |
	displacement := self environmentIdListWidth // 2.
	^ LayoutFrame new
		leftFraction: leftFraction offset: displacement;
		topFraction: topFraction offset: 0;
		rightFraction: (leftFraction + width) offset: (displacement // 2);
		bottomFraction: bottomFraction offset: self buttonHeight negated