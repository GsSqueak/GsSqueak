midi output
midiPlayLoop

	| mSecsPerStep tStart mSecs |
	mSecsPerStep := 5.
	[done] whileFalse: [
		tStart := Time millisecondClockValue.
		self processAllAtTick: ticksSinceStart asInteger.
		(Delay forMilliseconds: mSecsPerStep) wait.
		mSecs := Time millisecondClockValue - tStart.
		mSecs < 0 ifTrue: [mSecs := mSecsPerStep].  "clock wrap"
		ticksSinceStart := ticksSinceStart + (mSecs asFloat / (1000.0 * secsPerTick))].
