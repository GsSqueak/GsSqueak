accessing
positionInScore

	^ self ticksSinceStart asFloat / (self durationInTicks max: 1)