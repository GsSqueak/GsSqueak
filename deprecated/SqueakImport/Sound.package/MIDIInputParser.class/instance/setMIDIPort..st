private-other
setMIDIPort: aMIDIPort
	"Initialize this instance for recording from the given MIDI port. Tune and real-time commands are filtered out by default; the client can send noFiltering to receive these messages."

	midiPort := aMIDIPort.
	received := OrderedCollection new.
	self noFiltering.  "initializes cmdActionTable"
	self ignoreTuneAndRealTimeCommands.
