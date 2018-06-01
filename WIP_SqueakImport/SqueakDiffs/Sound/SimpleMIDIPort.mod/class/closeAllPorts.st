utilities
closeAllPorts
	"Close all MIDI ports."
	"SimpleMIDIPort closeAllPorts"

	| lastPortNum |
	lastPortNum := self primPortCount - 1.
	0 to: lastPortNum do: [:portNum | self basicNew primMIDIClosePort: portNum].
