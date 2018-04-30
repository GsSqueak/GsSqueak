instance creation
fromUser: gridPoint
	"Answer a Rectangle that is determined by having the user 
	designate the top left and bottom right corners. 
	The cursor reamins linked with the sensor, but
	the outline is kept gridded."
	| originRect |
	originRect := Cursor origin showWhile: 
		[((Sensor cursorPoint grid: gridPoint) extent: 0@0) newRectFrom:
			[:f | (Sensor cursorPoint grid: gridPoint) extent: 0@0]].
	^ Cursor corner showWhile:
		[originRect newRectFrom:
			[:f | f origin corner: (Sensor cursorPoint grid: gridPoint)]]