output
midiCmd: cmd channel: channel byte: dataByte
	"Immediately output the given MIDI command with the given channel and argument byte to this MIDI port. Assume that the port is open."

	accessSema critical: [
		self primMIDIWritePort: portNumber
			from: (ByteArray
					with: (cmd bitOr: channel)
					with: dataByte)
			at: 0].
