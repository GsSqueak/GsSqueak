accessing
positionInScore: pos

	self isPlaying ifTrue: [^ self "ignore rude intrusion"].
	ticksSinceStart := pos * durationInTicks.
	done := false.

