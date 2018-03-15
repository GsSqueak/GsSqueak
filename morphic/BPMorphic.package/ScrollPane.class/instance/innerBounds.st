geometry
innerBounds
	| _gsSqueakTemp_inner _gsSqueakTemp_bottomOffset _gsSqueakTemp_leftOffset _gsSqueakTemp_rightOffset |
	(retractableScrollBar
			or: [self vIsScrollbarShowing not])
		ifTrue: [_gsSqueakTemp_leftOffset := _gsSqueakTemp_rightOffset := 0]
		ifFalse: [scrollBarOnLeft
				ifTrue: [_gsSqueakTemp_leftOffset := self scrollBarThickness - self borderWidth.
					_gsSqueakTemp_rightOffset := 0]
				ifFalse: [_gsSqueakTemp_leftOffset := 0.
					_gsSqueakTemp_rightOffset := self scrollBarThickness - self borderWidth]].
	(retractableScrollBar
			or: [self hIsScrollbarShowing not])
		ifTrue: [_gsSqueakTemp_bottomOffset := 0]
		ifFalse: [_gsSqueakTemp_bottomOffset := self scrollBarThickness - self borderWidth].
	_gsSqueakTemp_inner := super innerBounds.
	^ _gsSqueakTemp_inner left + _gsSqueakTemp_leftOffset @ _gsSqueakTemp_inner top corner: _gsSqueakTemp_inner right - _gsSqueakTemp_rightOffset @ (_gsSqueakTemp_inner bottom - _gsSqueakTemp_bottomOffset)"+ topOffset"