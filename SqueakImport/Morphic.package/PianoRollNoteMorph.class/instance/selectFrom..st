selecting
selectFrom: selection 
	(trackIndex = selection first and: 
			[indexInTrack >= (selection second) and: [indexInTrack <= (selection third)]]) 
		ifTrue: [selected ifFalse: [self select]]
		ifFalse: [selected ifTrue: [self deselect]]