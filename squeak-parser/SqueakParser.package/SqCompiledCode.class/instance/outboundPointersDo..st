tracing
outboundPointersDo: t1 
	| t2 |
	t1 value: self class.
	t2 := self numLiterals.
	1
		to: t2
		do: [:t3 | t1
				value: (self literalAt: t3)]