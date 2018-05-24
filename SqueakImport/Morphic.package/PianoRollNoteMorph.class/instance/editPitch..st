editing
editPitch: evt

	| mk note |
	mk := owner midiKeyForY: evt cursorPoint y.
	note := (owner score tracks at: trackIndex) at: indexInTrack.
	note midiKey = mk ifTrue: [^ self].
	note midiKey: mk.
	self playSound: (self soundOfDuration: 999.0).
	self position: self position x @ ((owner yForMidiKey: mk) - 1)
