-widgets
frameFractions
	self layoutFrame
		ifNil: [^ 0 @ 0 corner: 1 @ 1].
	^ self layoutFrame leftFraction @ self layoutFrame topFraction corner: self layoutFrame rightFraction @ self layoutFrame bottomFraction