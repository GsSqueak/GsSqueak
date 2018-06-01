balloon drawing
drawGeneralBezierShape: contours color: c borderWidth: borderWidth borderColor: borderColor
	"Draw a general boundary shape (e.g., possibly containing holes)"
	| fillC borderC |
	fillC := self shadowColor ifNil:[c].
	borderC := self shadowColor ifNil:[borderColor].
	self ensuredEngine
		drawGeneralBezierShape: contours
		fill: fillC
		borderWidth: borderWidth
		borderColor: borderC
		transform: transform.