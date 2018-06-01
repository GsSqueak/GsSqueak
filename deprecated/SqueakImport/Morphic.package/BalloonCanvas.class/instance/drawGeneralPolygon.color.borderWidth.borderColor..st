balloon drawing
drawGeneralPolygon: contours color: c borderWidth: borderWidth borderColor: borderColor
	"Draw a general polygon (e.g., a polygon that can contain holes)"
	| fillC borderC |
	fillC := self shadowColor ifNil:[c].
	borderC := self shadowColor ifNil:[borderColor].
	self ensuredEngine
		drawGeneralPolygon: contours
		fill: fillC
		borderWidth: borderWidth
		borderColor: borderC
		transform: transform.