toolbuilder - layouting
environmentIdListFrame: bottomFraction

	| halfWidth |
	halfWidth := (self environmentIdListWidth // 2) - 6.
	^ LayoutFrame new
		leftFraction: 0.5 offset: halfWidth negated;
		topFraction: 0 offset: 0;
		rightFraction: 0.5 offset: halfWidth;
		bottomFraction: bottomFraction offset: self buttonHeight negated