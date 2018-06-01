initialization
initialize
"initialize the state of the receiver"
	super initialize.
""
	self addGraphic.
	bufferSize := 5000.
	buffer := WriteStream
				on: (SoundBuffer newMonoSampleCount: bufferSize).
	lastConePosition := 0.
	sound := SequentialSound new