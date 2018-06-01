midi output
startMIDIPlaying
	"Start up a process to play this score via MIDI."

	midiPort ensureOpen.
	midiPlayerProcess ifNotNil: [midiPlayerProcess terminate].
	midiPlayerProcess := [self midiPlayLoop] newProcess.
	midiPlayerProcess
		name: 'Score Player (', self score printString, ')';
		priority: Processor userInterruptPriority;
		resume.
