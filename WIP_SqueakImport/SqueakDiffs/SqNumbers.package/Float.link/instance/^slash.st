arithmetic
/ aNumber
	aNumber isZero ifTrue: [^(ZeroDivide dividend: self) signal].
	^ self _env0 / aNumber
