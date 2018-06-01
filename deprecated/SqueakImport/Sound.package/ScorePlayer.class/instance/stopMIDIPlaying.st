midi output
stopMIDIPlaying
	"Terminate the MIDI player process and turn off any active notes."

	midiPlayerProcess ifNotNil: [midiPlayerProcess terminate].
	midiPlayerProcess := nil.
	activeMIDINotes do: [:pair | pair first endNoteOnMidiPort: midiPort].
	activeMIDINotes := activeMIDINotes species new.
