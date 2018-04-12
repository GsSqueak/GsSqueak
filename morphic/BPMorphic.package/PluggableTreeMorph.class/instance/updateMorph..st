updating
updateMorph: morph 
	morph complexContents refresh.
	morph refresh.
	morph isExpanded
		ifTrue: [morph toggleExpandedState; toggleExpandedState.
			self adjustSubmorphPositions]
		ifFalse: [self changed]