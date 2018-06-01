operating
disableReverb: aBoolean

	aBoolean
		ifTrue: [SoundPlayer stopReverb]
		ifFalse: [SoundPlayer startReverb].
