initialize-release
classListFrame: bottomFraction fromLeft: leftFraction width: rightFraction
	^self
		classListFrame: bottomFraction
		fromTop: 0
		fromLeft: leftFraction
		width: rightFraction.