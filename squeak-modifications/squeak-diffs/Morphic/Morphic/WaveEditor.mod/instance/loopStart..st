accessing
loopStart: index

	| start len |
	start := self fractionalLoopStartAt: index.
	len := (loopEnd asFloat - start) + 1.0.
	loopCycles := (len / (samplingRate / perceivedFrequency)) rounded.
	self loopLength: len.
