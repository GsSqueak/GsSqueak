midi output
openMIDIPort: portNum
	"Open the given MIDI port. Music will be played as MIDI commands to the given MIDI port."

	midiPort := SimpleMIDIPort openOnPortNumber: portNum.
