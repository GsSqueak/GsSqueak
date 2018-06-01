output
midiOutput: aByteArray
	"Output the given bytes to this MIDI port immediately. Assume that the port is open."

	accessSema critical: [
		self primMIDIWritePort: portNumber from: aByteArray at: 0].
