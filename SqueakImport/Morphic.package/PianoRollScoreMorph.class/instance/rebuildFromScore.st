drawing
rebuildFromScore
	"Rebuild my submorphs from the score. This method should be invoked after changing the time scale, the color or visibility of a track, the extent of this morph, etc."

	score ifNil: [^ self].
	self addNotes.
