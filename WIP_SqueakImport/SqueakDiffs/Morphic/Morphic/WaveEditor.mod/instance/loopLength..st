accessing
loopLength: aNumber

	loopLength := aNumber.
	((loopCycles > 0) and: [loopLength > 0]) ifTrue: [
		perceivedFrequency := samplingRate asFloat * loopCycles / loopLength].

