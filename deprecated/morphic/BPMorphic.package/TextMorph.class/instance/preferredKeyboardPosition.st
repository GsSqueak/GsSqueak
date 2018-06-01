editing
preferredKeyboardPosition
	| _gsSqueakTemp_default _gsSqueakTemp_rects |
	_gsSqueakTemp_default := (self bounds: self bounds in: World) topLeft.
	paragraph
		ifNil: [^ _gsSqueakTemp_default].
	_gsSqueakTemp_rects := paragraph selectionRects.
	_gsSqueakTemp_rects size = 0
		ifTrue: [^ _gsSqueakTemp_default].
	^ _gsSqueakTemp_rects first bottomLeft