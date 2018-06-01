class initialization
initialize

	SoundService register: self.

	SoundService defaultOrNil
		ifNil: [SoundService default: self].