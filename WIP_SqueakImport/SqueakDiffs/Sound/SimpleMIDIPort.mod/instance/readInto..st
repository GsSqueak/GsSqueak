input
readInto: aByteArray
	"Read any data from this port into the given buffer."

	^ self primMIDIReadPort: portNumber into: aByteArray
