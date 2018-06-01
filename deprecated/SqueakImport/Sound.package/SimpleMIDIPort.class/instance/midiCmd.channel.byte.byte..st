output
midiCmd: cmd channel: channel byte: dataByte1 byte: dataByte2
	"Immediately output the given MIDI command with the given channel and argument bytes to this MIDI port. Assume that the port is open."

	accessSema critical: [
		self primMIDIWritePort: portNumber
			from: (ByteArray
					with: (cmd bitOr: channel)
					with: dataByte1
					with: dataByte2)
			at: 0].
