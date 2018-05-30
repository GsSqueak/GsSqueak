midi
outputOnMidiPort: aMidiPort
	"Output this event to the given MIDI port."

	aMidiPort
		midiCmd: 16rE0
		channel: channel
		byte: (bend bitAnd: 16r7F)
		byte: (bend bitShift: -7).
