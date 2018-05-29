as yet unclassified
startMIDITracking

	midiParser ifNil: [^ self].
	midiParser midiPort ifNil: [^ self].
	midiParser midiPort ensureOpen.
	self stopMIDITracking.
	SoundPlayer useShortBuffer.
	process := [self midiTrackingLoop] newProcess.
	process priority: Processor userInterruptPriority.
	process resume.
