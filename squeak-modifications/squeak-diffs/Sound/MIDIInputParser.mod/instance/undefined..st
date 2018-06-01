private-state machine
undefined: cmdByte
	"We have received an unexpected MIDI byte (e.g., a data byte when we were expecting a command). This should never happen."

	self error: 'unexpected MIDI byte ', cmdByte printString.
