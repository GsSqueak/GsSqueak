*SqCollectionLiterals-accessing
byteAt: index

	| d r |
	d := (index + 1) // 2.
	r := (index - 1) \\ 2 + 1.
	^ (self wordAt: d) digitAt: ((2 - r) + 1).
