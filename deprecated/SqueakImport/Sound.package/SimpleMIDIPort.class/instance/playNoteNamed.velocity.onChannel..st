primitives
playNoteNamed: aNotename velocity: aVel onChannel: aChannel
	self playNote: (AbstractSound midiKeyForPitch: aNotename) velocity: aVel onChannel: aChannel

	