balloon drawing
drawOval: r color: c borderWidth: borderWidth borderColor: borderColor 
	"Draw the oval defined by the given rectangle"
	| _gsSqueakTemp_fillC _gsSqueakTemp_borderC |
	_gsSqueakTemp_fillC := self shadowColor
				ifNil: [c].
	_gsSqueakTemp_borderC := self shadowColor
				ifNil: [borderColor].
	self ensuredEngine
		drawOval: r
		fill: _gsSqueakTemp_fillC
		borderWidth: borderWidth
		borderColor: _gsSqueakTemp_borderC
		transform: transform