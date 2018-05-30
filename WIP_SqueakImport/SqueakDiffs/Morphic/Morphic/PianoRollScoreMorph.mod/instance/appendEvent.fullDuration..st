editing
appendEvent: noteEvent fullDuration: fullDuration 

	| sel x |
	score appendEvent: noteEvent fullDuration: fullDuration at: (sel := self selection).
	noteEvent midiKey = -1 ifFalse:  "Unless it is a rest..."
		["Advance the selection to the note just entered"
		selection := Array with: sel first with: sel third + 1 with: sel third + 1].

	"This is all horribly inefficient..."
	scorePlayer updateDuration.
	(x := self xForTime: noteEvent endTime) > (self right - 30) ifTrue:
		[self autoScrollForX: x + (30 + self width // 4)].
	self updateLowestNote.
	self rebuildFromScore