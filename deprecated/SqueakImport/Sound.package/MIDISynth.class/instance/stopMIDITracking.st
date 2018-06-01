as yet unclassified
stopMIDITracking

	process ifNotNil: [
		process terminate.
		process := nil].
	SoundPlayer shutDown: true; initialize.  "revert to normal buffer size"
