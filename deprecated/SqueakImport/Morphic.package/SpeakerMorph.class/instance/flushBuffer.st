speaker
flushBuffer

	| buf |
	buf := buffer contents.
	buffer resetContents.
	sound isPlaying ifFalse: [sound := SequentialSound new].
	sound add: (SampledSound samples: buf samplingRate: 11025).
	sound isPlaying
		ifTrue: [sound pruneFinishedSounds]
		ifFalse: [sound play].
