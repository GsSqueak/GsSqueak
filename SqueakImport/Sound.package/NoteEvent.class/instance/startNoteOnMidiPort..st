midi
startNoteOnMidiPort: aMidiPort
	"Output a noteOn event to the given MIDI port."

	aMidiPort
		midiCmd: 16r90
		channel: channel
		byte: midiKey
		byte: velocity.
