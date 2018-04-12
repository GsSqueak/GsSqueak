toolbuilder - layouting
systemCategoryListFrame: bottomFraction fromTop: topFraction fromLeft: leftFraction width: width

	| displacement |
	displacement := self environmentIdListWidth // 4.
	^ LayoutFrame new
		leftFraction: leftFraction offset: 0;
		topFraction: topFraction offset: 0;
		rightFraction: (leftFraction + width) offset: displacement negated;
		bottomFraction: bottomFraction offset: 0