snapshotting
shutDown: quitting

	quitting ifTrue: [
		ScorePlayer allSubInstancesDo: [:ea | [ea stopMIDIPlaying] on: Error do: [] ] ].