accessing
startIndex: aNumber

	startIndex ~= aNumber ifTrue:  [
		startIndex := aNumber asInteger.
		self flushCachedForm].
