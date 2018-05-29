simple keyboard
mouseDownPitch: midiKey event: event noteMorph: keyMorph

	| sel noteEvent |
	event hand hasSubmorphs ifTrue: [^ self  "no response if drag something over me"].
	keyMorph color: playingKeyColor.
	(sel := pianoRoll selection) ifNil: [^ self].
	insertMode ifTrue:
		[sel := pianoRoll selectionForInsertion.
		insertMode := false].
	sel = prevSelection ifFalse:
		["This is a new selection -- need to determine start time"
		sel third = 0
			ifTrue: [startOfNextNote := 0]
			ifFalse: [startOfNextNote := ((pianoRoll score tracks at: sel first)
										at: sel third) endTime.
					startOfNextNote := startOfNextNote + self fullDuration - 1
										truncateTo: self fullDuration]].
	noteEvent := NoteEvent new time: startOfNextNote; duration: self noteDuration;
			key: midiKey + 23 velocity: self velocity channel: 1.
	pianoRoll appendEvent: noteEvent fullDuration: self fullDuration.
	soundPlaying ifNotNil: [soundPlaying stopGracefully].
	(soundPlaying := self soundForEvent: noteEvent inTrack: sel first) play.
	prevSelection := pianoRoll selection.
	startOfNextNote := startOfNextNote + self fullDuration.