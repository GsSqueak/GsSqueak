initialization
addCursorMorph
	self addMorph:
		(cursor := (RectangleMorph
				newBounds: (self innerBounds topLeft extent: 1@self innerBounds height)
				color: Color red)
						borderWidth: 0)