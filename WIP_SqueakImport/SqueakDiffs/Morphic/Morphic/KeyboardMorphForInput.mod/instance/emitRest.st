note controls
emitRest

	| sel noteEvent |

	"All this selection logic should be shared with mouseDown..."
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
			key: -1 "my flag for rest" velocity: self velocity channel: 1.
	pianoRoll appendEvent: noteEvent fullDuration: self fullDuration.
	soundPlaying ifNotNil: [soundPlaying stopGracefully].
	prevSelection := pianoRoll selection.
	startOfNextNote := startOfNextNote + self fullDuration.