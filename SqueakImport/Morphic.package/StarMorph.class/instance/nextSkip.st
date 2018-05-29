geometry
nextSkip
	"Set starRatio to next skip wrapping if needed."
	| skips n c r1 rN |
	c := vertices average rounded.
	r1 := (c dist: vertices first) truncated asFloat.
	rN := c dist: vertices last.
	skips := self skipRatios.
	n := skips * r1
				findFirst: [:r | r > (rN + 1.0)].
	"n = 0
		ifTrue: [n := skips size]."
	^ skips atWrap: n