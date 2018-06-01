actions
toggleSelectionAt: anInteger shifted: isShifted controlled: isMouseDragging 
	anInteger = 0 ifTrue: [ ^ nil ].
	(isMouseDragging not and: [anInteger = anchorIndex and: [ (messageSelections occurrencesOf: true) = 1 ]])
		ifTrue:
			[ self toggleMessageSelectionAt: anInteger.
			anchorIndex := nil.
			self messageListIndex: 0 ]
		ifFalse:
			[ self deselectAll.
			isShifted
				ifTrue: [ self selectAllBetweenAnchorAnd: anInteger ]
				ifFalse:
					[ self
						messageAt: anInteger
						beSelected: true.
					anchorIndex := anInteger ].
			self messageListIndex: anInteger ]