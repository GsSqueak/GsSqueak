geometry
vResizeScrollBar
	| _gsSqueakTemp_w _gsSqueakTemp_topLeft _gsSqueakTemp_border |
	_gsSqueakTemp_w := self scrollBarThickness.
	_gsSqueakTemp_border := self borderWidth.
	_gsSqueakTemp_topLeft := scrollBarOnLeft
				ifTrue: [retractableScrollBar
						ifTrue: [bounds topLeft - (_gsSqueakTemp_w - _gsSqueakTemp_border @ 0)]
						ifFalse: [bounds topLeft]]
				ifFalse: [retractableScrollBar
						ifTrue: [bounds topRight - (_gsSqueakTemp_border @ 0)]
						ifFalse: [bounds topRight - (_gsSqueakTemp_w @ 0)]].
	scrollBar
		bounds: (_gsSqueakTemp_topLeft extent: _gsSqueakTemp_w @ self vScrollBarHeight)