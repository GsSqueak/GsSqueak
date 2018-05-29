initialization
initialize

	super initialize.
	score := MIDIScore new initialize.
	instruments := Array new.
	overallVolume := 0.5.
	leftVols := Array new.
	rightVols := Array new.
	muted := Array new.
	rate := 1.0.
	repeat := false.
	durationInTicks := 100.