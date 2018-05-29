primitives
stopNoteNamed: aNotename velocity: aVel onChannel: aChannel
	self stopNote: (AbstractSound midiKeyForPitch: aNotename) velocity: aVel onChannel: aChannel
	 