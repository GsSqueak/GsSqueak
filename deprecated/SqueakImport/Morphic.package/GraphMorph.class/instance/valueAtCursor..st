accessing
valueAtCursor: aPointOrNumber

	data isEmpty ifTrue: [^ 0].
	data
		at: ((cursor truncated max: 1) min: data size)
		put: (self asNumber: aPointOrNumber).
	self flushCachedForm.
