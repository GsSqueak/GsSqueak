*SqNumbers-arithmetic
/ aNumber
	aNumber isZero ifTrue: [^(ZeroDivide dividend: self) signal].
	^ self @env0: / aNumber