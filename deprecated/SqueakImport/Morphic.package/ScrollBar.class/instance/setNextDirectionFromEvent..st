scrolling
setNextDirectionFromEvent: event

	nextPageDirection := self orientation == #horizontal
		ifTrue: [event cursorPoint x >= slider center x]
		ifFalse: [event cursorPoint y >= slider center y].
