as yet unclassified
processMIDIUntilMouseDown
	"Used for debugging. Do MIDI processing until the mouse is pressed."

	midiParser clearBuffers.
	[Sensor anyButtonPressed] whileFalse: [self processMIDI].
