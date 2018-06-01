geometry
prevTwinkleSkip
	"Set starRatio to next skip wrapping if necessary"
	| skips n c r1 rN |
	c := vertices average rounded.
	r1 := c dist: vertices first.
	rN := (c dist: vertices last) truncated asFloat.
	skips := self skipRatios.
	n := skips * r1
				findLast: [:r | r + 1.0 < rN].
	"n = 0
	ifTrue: [^ oldR]."
	^ skips atWrap: n