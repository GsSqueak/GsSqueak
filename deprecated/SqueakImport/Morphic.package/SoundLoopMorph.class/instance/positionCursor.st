playing
positionCursor
	| x |
	x := controlIndex * 128 // self controlRate.
	cursor position: self innerBounds topLeft + (x@0)
