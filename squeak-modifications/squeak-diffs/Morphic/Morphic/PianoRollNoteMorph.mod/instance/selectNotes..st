selecting
selectNotes: evt

	| lastMorph oldEnd saveOwner |
	saveOwner := owner.
	(owner autoScrollForX: evt cursorPoint x) ifTrue:
		["If scroll talkes place I will be deleted and my x-pos will become invalid."
		owner := saveOwner.
		bounds := bounds withLeft: (owner xForTime: self noteInScore time)].
	oldEnd := owner selection last.
	(owner notesInRect: (evt cursorPoint x @ owner top corner: owner bottomRight))
		do: [:m | m trackIndex = trackIndex ifTrue: [m deselect]].
	self select.  lastMorph := self.
	(owner notesInRect: (self left @ owner top corner: evt cursorPoint x @ owner bottom))
		do: [:m | m trackIndex = trackIndex ifTrue: [m select.  lastMorph := m]].
	owner selection: (Array with: trackIndex with: indexInTrack with: lastMorph indexInTrack).
	lastMorph indexInTrack ~= oldEnd ifTrue:
		["Play last note as selection grows or shrinks"
		owner ifNotNil: [lastMorph playSound]]
