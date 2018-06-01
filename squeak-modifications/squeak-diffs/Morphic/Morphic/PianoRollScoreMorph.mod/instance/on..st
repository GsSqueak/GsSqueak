initialization
on: aScorePlayer

	scorePlayer := aScorePlayer.
	score := aScorePlayer score.
	colorForTrack := Color wheel: score tracks size.
	leftEdgeTime := 0.
	timeScale := 0.1.
	indexInTrack := Array new: score tracks size withAll: 1.
	lastUpdateTick := -1.

	self updateLowestNote
