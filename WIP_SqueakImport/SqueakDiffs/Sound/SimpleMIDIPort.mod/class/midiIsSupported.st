utilities
midiIsSupported
	"Answer true if this platform supports MIDI."

	^ self primPortCount > 0
