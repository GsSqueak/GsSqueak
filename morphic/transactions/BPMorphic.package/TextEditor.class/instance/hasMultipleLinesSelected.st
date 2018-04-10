typing support
hasMultipleLinesSelected
	^ self hasSelection
		and: [self startBlock top < self stopBlock top]