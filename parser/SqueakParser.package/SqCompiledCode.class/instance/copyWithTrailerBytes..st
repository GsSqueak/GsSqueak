copying
copyWithTrailerBytes: t1 
	| t2 t3 t4 |
	t4 := self initialPC.
	t3 := self endPC.
	t2 := t1
				createMethod: t3 - t4 + 1
				class: self class
				header: self header.
	1
		to: self numLiterals
		do: [:t5 | t2
				literalAt: t5
				put: (self literalAt: t5)].
	t4
		to: t3
		do: [:t5 | t2
				at: t5
				put: (self at: t5)].
	t2 postCopy.
	^ t2