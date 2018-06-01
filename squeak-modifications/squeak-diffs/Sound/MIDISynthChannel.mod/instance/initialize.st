initialization
initialize

	super initialize.
	instrument := FMSound default.
	muted := false.
	masterVolume := 0.5.
	channelVolume := 1.0.
	pan := 0.5.
	pitchBend := 0.0.
	activeSounds := OrderedCollection new.
