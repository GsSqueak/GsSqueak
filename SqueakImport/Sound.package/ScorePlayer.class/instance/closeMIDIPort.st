midi output
closeMIDIPort
	"Stop using MIDI for output. Music will be played using the built-in sound synthesis."

	self pause.
	midiPort := nil.
