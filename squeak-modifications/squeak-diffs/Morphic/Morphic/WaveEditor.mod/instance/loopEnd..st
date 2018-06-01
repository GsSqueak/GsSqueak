accessing
loopEnd: aNumber

	loopEnd := (aNumber asInteger max: 1) min: graph data size.
	possibleLoopStarts := nil.
