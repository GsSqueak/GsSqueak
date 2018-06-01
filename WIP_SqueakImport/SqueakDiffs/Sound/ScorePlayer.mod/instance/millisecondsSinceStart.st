accessing
millisecondsSinceStart
	"Answer the approximate number of milliseconds of real time since the beginning of the score. Since this calculation uses the current tempo, which can change throughout the piece, it is safer to use ticksSinceStart for synchronization."

	^ (secsPerTick * ticksSinceStart * 1000) asInteger
