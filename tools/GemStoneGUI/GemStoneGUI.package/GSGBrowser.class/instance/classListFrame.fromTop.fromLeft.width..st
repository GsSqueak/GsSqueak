toolbuilder - layouting
classListFrame: bottomFraction fromTop: topFraction fromLeft: leftFraction width: rightFraction

	| displacement |
	displacement := self environmentIdListWidth // 2.
	^ LayoutFrame new
		leftFraction: leftFraction offset: (displacement // 2) negated;
		topFraction: topFraction offset: 0;
		rightFraction: (leftFraction + rightFraction) offset: displacement negated;
		bottomFraction: bottomFraction offset: self buttonHeight negated