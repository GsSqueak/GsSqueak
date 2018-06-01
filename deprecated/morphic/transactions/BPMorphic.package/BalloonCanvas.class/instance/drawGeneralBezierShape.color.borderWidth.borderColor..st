balloon drawing
drawGeneralBezierShape: contours color: c borderWidth: borderWidth borderColor: borderColor 
	"Draw a general boundary shape (e.g., possibly containing holes)"
	| _gsSqueakTemp_fillC _gsSqueakTemp_borderC |
	_gsSqueakTemp_fillC := self shadowColor
				ifNil: [c].
	_gsSqueakTemp_borderC := self shadowColor
				ifNil: [borderColor].
	self ensuredEngine
		drawGeneralBezierShape: contours
		fill: _gsSqueakTemp_fillC
		borderWidth: borderWidth
		borderColor: _gsSqueakTemp_borderC
		transform: transform