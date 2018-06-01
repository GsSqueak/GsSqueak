input
flushInput
	"Read any lingering MIDI data from this port's input buffer."

	| buf |
	buf := ByteArray new: 1000.
	[(self readInto: buf) > 0] whileTrue.
