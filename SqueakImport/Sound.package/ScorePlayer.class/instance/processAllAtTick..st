sound generation
processAllAtTick: scoreTick

	self processTempoMapAtTick: scoreTick.
	midiPort
		ifNil: [self processNoteEventsAtTick: scoreTick]
		ifNotNil: [self processMIDIEventsAtTick: scoreTick].
	self processAmbientEventsAtTick: scoreTick.
	self isDone ifTrue: [
		repeat
			ifTrue: [self reset]
			ifFalse: [done := true]].
