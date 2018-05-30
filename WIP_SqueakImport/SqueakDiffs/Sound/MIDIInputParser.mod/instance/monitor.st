midi monitor
monitor
	"Print MIDI messages to the transcript until any mouse button is pressed."

	self midiDoUntilMouseDown: [:cmd :arg1 :arg2 |
		self printCmd: cmd with: arg1 with: arg2].
