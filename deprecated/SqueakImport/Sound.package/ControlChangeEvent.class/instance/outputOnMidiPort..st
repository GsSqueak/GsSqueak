midi
outputOnMidiPort: aMidiPort
	"Output this event to the given MIDI port."

	aMidiPort
		midiCmd: 16rB0
		channel: channel
		byte: control
		byte: value.
