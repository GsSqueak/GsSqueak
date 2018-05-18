balloon drawing
drawRectangle: r color: c borderWidth: borderWidth borderColor: borderColor
	"Draw a rectangle"
	| fillC borderC |
	fillC := self shadowColor ifNil:[c].
	borderC := self shadowColor ifNil:[borderColor].
	self ensuredEngine
		drawRectangle: r
		fill: fillC
		borderWidth: borderWidth
		borderColor: borderC
		transform: transform.