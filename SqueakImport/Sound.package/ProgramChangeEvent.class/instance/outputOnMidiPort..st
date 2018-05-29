midi
outputOnMidiPort: aMidiPort
	"Output this event to the given MIDI port."

	aMidiPort
		midiCmd: 16rC0
		channel: channel
		byte: program.
