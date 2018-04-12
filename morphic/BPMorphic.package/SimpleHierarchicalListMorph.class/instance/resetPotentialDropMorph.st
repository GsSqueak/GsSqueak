drag and drop
resetPotentialDropMorph
	potentialDropMorph
		ifNotNil: [potentialDropMorph resetHighlightForDrop.
			potentialDropMorph := nil]