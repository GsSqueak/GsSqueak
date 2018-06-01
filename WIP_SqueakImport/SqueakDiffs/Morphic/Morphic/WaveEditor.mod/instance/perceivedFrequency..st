accessing
perceivedFrequency: aNumber

	perceivedFrequency := aNumber.
	(loopCycles > 0) ifTrue: [
		loopLength := samplingRate asFloat * loopCycles / perceivedFrequency].
