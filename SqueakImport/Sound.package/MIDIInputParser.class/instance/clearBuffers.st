recording
clearBuffers
	"Clear the MIDI record buffers. This should be called at the start of recording or real-time MIDI processing."	

	received := received species new: 5000.
	rawDataBuffer := ByteArray new: 1000.
	sysExBuffer := WriteStream on: (ByteArray new: 100).
	midiPort ifNotNil: [midiPort ensureOpen; flushInput].
	startTime := Time millisecondClockValue.
	state := #idle.
