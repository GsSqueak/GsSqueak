midi
endNoteOnMidiPort: aMidiPort
	"Output a noteOff event to the given MIDI port. (Actually, output a noteOff event with zero velocity. This does the same thing, but allows running status to be used when sending a mixture of note on and off commands.)"

	aMidiPort
		midiCmd: 16r90
		channel: channel
		byte: midiKey
		byte: 0.
