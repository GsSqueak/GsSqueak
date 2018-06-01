event handling
mouseDown: evt

	hitLoc := evt cursorPoint.
	editMode := nil.
	owner submorphsDo:
		[:m | (m isKindOf: PianoRollNoteMorph) ifTrue: [m deselect]].
	selected := true.
	self changed.
	owner selection: (Array with: trackIndex with: indexInTrack with: indexInTrack).
	self playSound