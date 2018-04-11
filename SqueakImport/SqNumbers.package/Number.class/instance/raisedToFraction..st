mathematical functions
raisedToFraction: aFraction
	self isZero
		ifTrue:
			[aFraction negative ifTrue: [^ (ZeroDivide dividend: 1) signal].
			^self].
	self negative ifFalse: [^(self ln * aFraction) exp].
	aFraction denominator even
		ifTrue: [^ ArithmeticError signal: 'nth root only defined for positive Integer n.'].
	^(self negated ln * aFraction) exp negated