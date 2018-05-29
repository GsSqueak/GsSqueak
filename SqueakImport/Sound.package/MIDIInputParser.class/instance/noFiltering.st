midi filtering
noFiltering
	"Revert to accepting all MIDI commands on all channels. This undoes any earlier request to filter the incoming MIDI stream."

	cmdActionTable := DefaultMidiTable deepCopy.
	ignoreSysEx := false.
