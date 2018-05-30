as yet unclassified
closeMIDIPort

	midiParser midiPort ifNil: [^ self].
	midiParser midiPort close.
	midiParser midiPort: nil.
