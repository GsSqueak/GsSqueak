geometry
tickTimeAtCursor
	cursor ifNil: [^ 0].
	^ self timeForX: cursor left