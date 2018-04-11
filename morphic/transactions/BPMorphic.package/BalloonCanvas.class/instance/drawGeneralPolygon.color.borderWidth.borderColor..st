balloon drawing
drawGeneralPolygon: contours color: c borderWidth: borderWidth borderColor: borderColor 
	"Draw a general polygon (e.g., a polygon that can contain holes)"
	| _gsSqueakTemp_fillC _gsSqueakTemp_borderC |
	_gsSqueakTemp_fillC := self shadowColor
				ifNil: [c].
	_gsSqueakTemp_borderC := self shadowColor
				ifNil: [borderColor].
	self ensuredEngine
		drawGeneralPolygon: contours
		fill: _gsSqueakTemp_fillC
		borderWidth: borderWidth
		borderColor: _gsSqueakTemp_borderC
		transform: transform