geometry
hResizeScrollBar
	| _gsSqueakTemp_topLeft _gsSqueakTemp_h _gsSqueakTemp_border _gsSqueakTemp_offset |
	self hScrollBarPolicy == #never
		ifTrue: [^ self].
	bounds
		ifNil: [self fullBounds].
	_gsSqueakTemp_h := self scrollBarThickness.
	_gsSqueakTemp_border := borderWidth.
	_gsSqueakTemp_offset := (scrollBarOnLeft
					and: [self vIsScrollbarShowing
							and: [retractableScrollBar not]])
				ifTrue: [_gsSqueakTemp_h]
				ifFalse: [0].
	_gsSqueakTemp_topLeft := retractableScrollBar
				ifTrue: [bounds bottomLeft + (_gsSqueakTemp_offset @ _gsSqueakTemp_border negated)]
				ifFalse: [bounds bottomLeft + (_gsSqueakTemp_offset @ _gsSqueakTemp_h negated)].
	hScrollBar
		bounds: (_gsSqueakTemp_topLeft extent: self hScrollBarWidth @ _gsSqueakTemp_h)