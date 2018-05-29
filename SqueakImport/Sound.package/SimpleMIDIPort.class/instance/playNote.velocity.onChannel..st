primitives
playNote: aNote velocity: aVel onChannel: aChannel
	self midiCmd: 144 channel: aChannel byte: aNote byte: aVel