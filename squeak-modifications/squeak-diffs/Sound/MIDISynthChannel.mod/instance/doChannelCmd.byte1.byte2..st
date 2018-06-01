midi dispatching
doChannelCmd: cmdByte byte1: byte1 byte2: byte2
	"Dispatch a channel command with the given arguments."
	"Details: Cases appear in order of expected frequency, most frequent cases first."

	cmdByte = 144 ifTrue: [
		byte2 = 0
			ifTrue: [^ self keyUp: byte1 vel: 0]
			ifFalse: [^ self keyDown: byte1 vel: byte2]].
	cmdByte = 128 ifTrue: [^ self keyUp: byte1 vel: byte2].
	cmdByte = 224 ifTrue: [^ self pitchBend: ((byte2 bitShift: 7) + byte1) - 8192].
	cmdByte = 176 ifTrue: [^ self control: byte1 value: byte2].
	cmdByte = 208 ifTrue: [^ self channelPressure: byte1].
	cmdByte = 160 ifTrue: [^ self key: byte1 pressure: byte2].
	cmdByte = 192 ifTrue: [^ self programChange: byte1].
