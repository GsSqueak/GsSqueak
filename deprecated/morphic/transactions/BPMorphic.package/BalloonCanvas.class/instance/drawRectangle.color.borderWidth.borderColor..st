balloon drawing
drawRectangle: r color: c borderWidth: borderWidth borderColor: borderColor 
	"Draw a rectangle"
	| _gsSqueakTemp_fillC _gsSqueakTemp_borderC |
	_gsSqueakTemp_fillC := self shadowColor
				ifNil: [c].
	_gsSqueakTemp_borderC := self shadowColor
				ifNil: [borderColor].
	self ensuredEngine
		drawRectangle: r
		fill: _gsSqueakTemp_fillC
		borderWidth: borderWidth
		borderColor: _gsSqueakTemp_borderC
		transform: transform