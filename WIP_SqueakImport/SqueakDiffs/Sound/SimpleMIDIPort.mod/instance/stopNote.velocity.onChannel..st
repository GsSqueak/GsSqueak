primitives
stopNote: aNote velocity: aVel onChannel: aChannel
	self midiCmd: 128 channel: aChannel byte: aNote byte: aVel