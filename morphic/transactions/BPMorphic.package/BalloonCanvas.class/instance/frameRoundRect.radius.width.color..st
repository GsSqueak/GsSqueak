drawing-rectangles
frameRoundRect: aRectangle radius: radius width: borderWidth color: borderColor 
	| _gsSqueakTemp_outerPoints _gsSqueakTemp_innerRect _gsSqueakTemp_innerRadius _gsSqueakTemp_innerPoints |
	(borderWidth isZero
			or: [borderColor isTransparent])
		ifTrue: [^ self].
	radius asPoint <= (0 @ 0)
		ifTrue: [^ self
				frameRectangle: aRectangle
				width: borderWidth
				color: borderColor].
	"decompose inner rectangle into bezier shape"
	_gsSqueakTemp_innerRect := aRectangle insetBy: borderWidth.
	_gsSqueakTemp_innerRect area <= 0
		ifTrue: [^ self
				fillRoundRect: aRectangle
				radius: radius
				fillStyle: borderColor].
	_gsSqueakTemp_innerRadius := (radius - borderWidth) asPoint.
	_gsSqueakTemp_innerPoints := self makeRoundRectShape: _gsSqueakTemp_innerRect radius: _gsSqueakTemp_innerRadius.
	"decompose outer rectangle into bezier shape"
	_gsSqueakTemp_outerPoints := self makeRoundRectShape: aRectangle radius: radius.
	self
		drawGeneralBezierShape: (Array with: _gsSqueakTemp_outerPoints with: _gsSqueakTemp_innerPoints)
		color: borderColor
		borderWidth: 0
		borderColor: nil