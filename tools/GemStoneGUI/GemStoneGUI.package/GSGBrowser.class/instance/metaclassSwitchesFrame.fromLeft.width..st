toolbuilder - layouting
metaclassSwitchesFrame: bottomFraction fromLeft: leftFraction width: rightFraction

	| displacement |
	displacement := self environmentIdListWidth // 2.
	^ LayoutFrame new
		leftFraction: leftFraction offset: displacement;
		topFraction: bottomFraction offset: self buttonHeight negated;
		rightFraction: (leftFraction + rightFraction) offset: (displacement // 2);
		bottomFraction: bottomFraction offset: 0