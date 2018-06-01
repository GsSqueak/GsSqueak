other
newSliderValue: newValue
	"Send a control command out the MIDI port."

	| val |
	midiPort ifNil: [^ self].
	val := newValue asInteger.
	lastValue = val ifTrue: [^ self].
	lastValue := val.
	midiPort midiCmd: 16rB0 channel: channel byte: controller byte: val.
