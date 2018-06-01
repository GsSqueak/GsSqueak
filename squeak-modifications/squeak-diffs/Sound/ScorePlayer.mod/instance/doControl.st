sound generation
doControl

	super doControl.
	1 to: activeSounds size do: [:i | (activeSounds at: i) first doControl].
	ticksSinceStart := ticksSinceStart + ticksClockIncr.
	self processAllAtTick: ticksSinceStart asInteger.
