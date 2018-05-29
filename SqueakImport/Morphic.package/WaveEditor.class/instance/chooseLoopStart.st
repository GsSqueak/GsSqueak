menu
chooseLoopStart 

	| bestLoops choice start labels values |
	possibleLoopStarts ifNil: [
		UIManager default
			informUser: 'Finding possible loop points...' translated
			during: [possibleLoopStarts := self findPossibleLoopStartsFrom: graph cursor]].
	bestLoops := possibleLoopStarts copyFrom: 1 to: (100 min: possibleLoopStarts size).
	labels := OrderedCollection new.
	values := OrderedCollection new.
	bestLoops do: [:entry |
		| secs |
		secs := ((loopEnd - entry first) asFloat / self samplingRate) printShowingMaxDecimalPlaces: 2.
		labels add: ('{1} cycles; {2} secs' translated format:{entry third. secs}).
		values add: entry].
	choice := UIManager default chooseFrom: labels values: values.
	choice ifNil: [^ self].
	loopCycles := choice third.
	start := self fractionalLoopStartAt: choice first.
	self loopLength: (loopEnd asFloat - start) + 1.0.
