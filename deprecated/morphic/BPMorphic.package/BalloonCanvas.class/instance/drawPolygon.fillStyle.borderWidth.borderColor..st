drawing-polygons
drawPolygon: vertices fillStyle: aFillStyle borderWidth: borderWidth borderColor: borderColor 
	"Draw a simple polygon defined by the list of vertices."
	| _gsSqueakTemp_fillC _gsSqueakTemp_borderC |
	vertices
		ifEmpty: [^ self].
	_gsSqueakTemp_fillC := self shadowColor
				ifNil: [aFillStyle].
	_gsSqueakTemp_borderC := self shadowColor
				ifNil: [borderColor].
	self ensuredEngine
		drawPolygon: (vertices copyWith: vertices first)
		fill: _gsSqueakTemp_fillC
		borderWidth: borderWidth
		borderColor: _gsSqueakTemp_borderC
		transform: transform