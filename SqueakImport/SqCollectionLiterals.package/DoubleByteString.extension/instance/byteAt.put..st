*SqCollectionLiterals-accessing
byteAt: index put: aByte

	| d r w |
	d := (index + 1) // 2.
	r := (index - 1) \\ 2 + 1.
	w := (self wordAt: d) bitAnd: ((16rFF<<((2 - r)*8)) bitInvert32).
	w := w + (aByte<<((2 - r)*8)).
	self basicAt: d put: w.
	^ aByte.
