open/close
ensureOpen
	"Make sure this MIDI port is open. It is good to call this before starting to use a port in case an intervening image save/restore has caused the underlying hardware port to get closed."

	portNumber ifNil: [^ self error: 'Use "openOn:" to open a MIDI port initially'].
	self primMIDIClosePort: portNumber.
	self primMIDIOpenPort: portNumber readSemaIndex: 0 interfaceClockRate: InterfaceClockRate.
	accessSema := Semaphore forMutualExclusion.
	lastCommandByteOut := Array new: 16 withAll: 0.  "clear running status"
