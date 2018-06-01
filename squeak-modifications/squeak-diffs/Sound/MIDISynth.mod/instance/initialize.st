as yet unclassified
initialize

	super initialize.
	midiParser := MIDIInputParser on: nil.
	channels := (1 to: 16) collect: [:ch | MIDISynthChannel new initialize].
