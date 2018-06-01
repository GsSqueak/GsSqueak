menu
fill

	| fillPt |
	Cursor blank show.
	fillPt := Cursor crossHair showWhile:
		[Sensor waitButton - self position].
	originalForm shapeFill: brushColor interiorPoint: fillPt.
	self changed.
