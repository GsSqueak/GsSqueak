*SqNumbers-private
setNumerator: n denominator: d

	d isZero ifTrue: [ ^(ZeroDivide dividend: n) signal ].
	numerator := n asInteger.
	(denominator := d asInteger) negative ifTrue: [ "keep sign in numerator"
		numerator := numerator negated.
		denominator := denominator negated ]
