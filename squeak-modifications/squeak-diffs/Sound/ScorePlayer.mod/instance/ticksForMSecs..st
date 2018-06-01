accessing
ticksForMSecs: mSecs

	^ (mSecs asFloat / (1000.0 * secsPerTick)) rounded
