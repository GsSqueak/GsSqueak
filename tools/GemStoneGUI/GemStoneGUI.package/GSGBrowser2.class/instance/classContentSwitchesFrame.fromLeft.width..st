toolbuilder - layouting
classContentSwitchesFrame: bottomFraction fromLeft: leftFraction width: rightFraction

	| displacement |
	displacement := self environmentIdListWidth // 2.
	^ LayoutFrame new
		leftFraction: leftFraction offset: (displacement // 2) negated;
		topFraction: bottomFraction offset: self buttonHeight negated;
		rightFraction: (leftFraction + rightFraction) offset: displacement negated;
		bottomFraction: bottomFraction offset: 0