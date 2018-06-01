layout
proposedCorrectionWouldCauseFocusChange: correction 
	^ Preferences mouseOverForKeyboardFocus
		and: [| edge | splitsTopAndBottom
				ifTrue: [edge := correction positive
								ifTrue: [self bottom + 3]
								ifFalse: [self top - 3].
					self activeHand position y inRangeOf: edge and: edge + correction]
				ifFalse: [edge := correction positive
								ifTrue: [self right]
								ifFalse: [self left].
					self activeHand position x inRangeOf: edge and: edge + correction]]