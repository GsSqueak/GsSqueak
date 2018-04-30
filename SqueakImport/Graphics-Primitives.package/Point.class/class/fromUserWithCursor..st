instance creation
fromUserWithCursor: aCursor
	Sensor waitNoButton.
	aCursor showWhile:[Sensor waitButton].
	^ Sensor cursorPoint

"Point fromUserWithCursor: Cursor target"