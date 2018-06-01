initialization
flush

	| valuesAndCounts |
	self bag ifNil: [^self]. "nothing to do yet"
	valuesAndCounts := self bag sortedCounts.
	valuesAndCounts size < self limit
		ifTrue: [self basicLimit: valuesAndCounts size].
	self values: ((valuesAndCounts collect: [:ea | ea value]) first: self limit).
	self counts: ((valuesAndCounts collect: [:ea | ea key]) first: self limit).
	self max: self counts max.
	self sum: self counts sum.

	self flushCachedForm.
