real-time processing
midiDoUntilMouseDown: midiActionBlock
	"Process the incoming MIDI stream in real time by calling midiActionBlock for each MIDI event. This block takes three arguments: the MIDI command byte and two argument bytes. One or both argument bytes may be nil, depending on the MIDI command. If not nil, evaluatue idleBlock regularly whether MIDI data is available or not. Pressing any mouse button terminates the interaction."

	| time cmd arg1 arg2 |
	self clearBuffers.
	[Sensor anyButtonPressed] whileFalse: [
		self midiDo: [:item |
			time := item at: 1.
			cmd := item at: 2.
			arg1 := arg2 := nil.
			item size > 2 ifTrue: [
				arg1 := item at: 3.
				item size > 3 ifTrue: [arg2 := item at: 4]].
				midiActionBlock value: cmd value: arg1 value: arg2]].
