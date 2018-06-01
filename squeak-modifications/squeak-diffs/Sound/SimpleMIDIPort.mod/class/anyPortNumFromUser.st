utilities
anyPortNumFromUser

	^ UIManager default
		chooseFrom: ((0 to: self primPortCount - 1) collect:[:i| self portDescription: i])
		values: (0 to: self primPortCount - 1)
		title: 'MIDI port for default usage:' translated
