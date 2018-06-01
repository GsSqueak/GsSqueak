displaying
showGridded: gridPoint 
	"Make the current cursor shape be the receiver, forcing the location of
	the cursor to the point nearest gridPoint."
	Sensor
		cursorPoint: (Sensor cursorPoint grid: gridPoint).
	Cursor currentCursor: self