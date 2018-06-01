editing
insertSelection
	self selection isNil ifTrue: [^self].
	score insertEvents: NotePasteBuffer at: self selection.
	scorePlayer updateDuration.
	self rebuildFromScore