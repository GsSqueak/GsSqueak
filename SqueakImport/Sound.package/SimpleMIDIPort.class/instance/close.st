open/close
close
	"Close this MIDI port."

	portNumber ifNotNil: [self primMIDIClosePort: portNumber].
	accessSema := nil.
	lastCommandByteOut := nil.
