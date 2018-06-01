drawing
drawWrapBorderOn: aCanvas 
	| _gsSqueakTemp_offset _gsSqueakTemp_rect |
	self wantsWrapBorder
		ifFalse: [^ self].
	textMorph
		ifNil: [^ self].
	_gsSqueakTemp_offset := textMorph margins isRectangle
				ifTrue: [textMorph margins left]
				ifFalse: [textMorph margins isPoint
						ifTrue: [textMorph margins x]
						ifFalse: [textMorph margins]].
	_gsSqueakTemp_offset := _gsSqueakTemp_offset + ((textMorph textStyle defaultFont widthOf: $x)
					* self class visualWrapBorderLimit).
	_gsSqueakTemp_offset > self width
		ifTrue: [^ self].
	_gsSqueakTemp_rect := scroller topLeft + (_gsSqueakTemp_offset @ 0) corner: scroller bottomRight.
	aCanvas fillRectangle: _gsSqueakTemp_rect color: self wrapBorderColor.
	aCanvas
		line: _gsSqueakTemp_rect topLeft
		to: _gsSqueakTemp_rect bottomLeft
		width: self borderStyle width
		color: (self wrapBorderColor muchDarker alpha: 0.5)