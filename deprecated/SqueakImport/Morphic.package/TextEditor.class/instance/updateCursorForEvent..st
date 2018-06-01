events
updateCursorForEvent: evt 

	(((morph bounds containsPoint: evt position)
		and: [morph dragEnabled not or: [(self isEventInSelection: evt) not]])
		and: [evt hand temporaryCursor ~~ Cursor text])
			ifTrue: [evt hand showTemporaryCursor: Cursor text]
			ifFalse: [evt hand showTemporaryCursor: nil].