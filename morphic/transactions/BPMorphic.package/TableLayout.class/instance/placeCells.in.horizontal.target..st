layout
placeCells: arrangement in: newBounds horizontal: aBool target: aMorph 
	"Place the morphs within the cells accordingly"
	| _gsSqueakTemp_xDir _gsSqueakTemp_yDir _gsSqueakTemp_anchor _gsSqueakTemp_yDist _gsSqueakTemp_place _gsSqueakTemp_cell _gsSqueakTemp_xDist _gsSqueakTemp_cellRect _gsSqueakTemp_corner _gsSqueakTemp_inset |
	_gsSqueakTemp_inset := properties cellInset.
	(_gsSqueakTemp_inset isNumber
			and: [_gsSqueakTemp_inset isZero])
		ifTrue: [_gsSqueakTemp_inset := nil].
	aBool
		ifTrue: ["horizontal layout"
			properties listDirection == #rightToLeft
				ifTrue: [_gsSqueakTemp_xDir := -1 @ 0.
					properties wrapDirection == #bottomToTop
						ifTrue: [_gsSqueakTemp_yDir := 0 @ -1.
							_gsSqueakTemp_anchor := newBounds bottomRight]
						ifFalse: [_gsSqueakTemp_yDir := 0 @ 1.
							_gsSqueakTemp_anchor := newBounds topRight]]
				ifFalse: [_gsSqueakTemp_xDir := 1 @ 0.
					properties wrapDirection == #bottomToTop
						ifTrue: [_gsSqueakTemp_yDir := 0 @ -1.
							_gsSqueakTemp_anchor := newBounds bottomLeft]
						ifFalse: [_gsSqueakTemp_yDir := 0 @ 1.
							_gsSqueakTemp_anchor := newBounds topLeft]]]
		ifFalse: ["vertical layout"
			properties listDirection == #bottomToTop
				ifTrue: [_gsSqueakTemp_xDir := 0 @ -1.
					properties wrapDirection == #rightToLeft
						ifTrue: [_gsSqueakTemp_yDir := -1 @ 0.
							_gsSqueakTemp_anchor := newBounds bottomRight]
						ifFalse: [_gsSqueakTemp_yDir := 1 @ 0.
							_gsSqueakTemp_anchor := newBounds bottomLeft]]
				ifFalse: [_gsSqueakTemp_xDir := 0 @ 1.
					_gsSqueakTemp_anchor := properties wrapDirection == #rightToLeft
								ifTrue: [_gsSqueakTemp_yDir := -1 @ 0.
									newBounds topRight]
								ifFalse: [_gsSqueakTemp_yDir := 1 @ 0.
									newBounds topLeft]]].
	1
		to: arrangement size
		do: [:i | 
			_gsSqueakTemp_cell := arrangement at: i.
			_gsSqueakTemp_cell extraSpace
				ifNotNil: [_gsSqueakTemp_anchor := _gsSqueakTemp_anchor + (_gsSqueakTemp_cell extraSpace y * _gsSqueakTemp_yDir)].
			_gsSqueakTemp_yDist := _gsSqueakTemp_cell cellSize y * _gsSqueakTemp_yDir.
			"secondary advance direction"
			_gsSqueakTemp_place := _gsSqueakTemp_anchor.
			_gsSqueakTemp_cell := _gsSqueakTemp_cell nextCell.
			[_gsSqueakTemp_cell isNil]
				whileFalse: [_gsSqueakTemp_cell extraSpace
						ifNotNil: [_gsSqueakTemp_place := _gsSqueakTemp_place + (_gsSqueakTemp_cell extraSpace x * _gsSqueakTemp_xDir)].
					_gsSqueakTemp_xDist := _gsSqueakTemp_cell cellSize x * _gsSqueakTemp_xDir.
					"primary advance direction"
					_gsSqueakTemp_corner := _gsSqueakTemp_place + _gsSqueakTemp_xDist + _gsSqueakTemp_yDist.
					_gsSqueakTemp_cellRect := Rectangle
								origin: (_gsSqueakTemp_place min: _gsSqueakTemp_corner)
								corner: (_gsSqueakTemp_place max: _gsSqueakTemp_corner).
					_gsSqueakTemp_inset
						ifNotNil: [_gsSqueakTemp_cellRect := _gsSqueakTemp_cellRect insetBy: _gsSqueakTemp_inset].
					_gsSqueakTemp_cell target layoutInBounds: _gsSqueakTemp_cellRect.
					_gsSqueakTemp_place := _gsSqueakTemp_place + _gsSqueakTemp_xDist.
					_gsSqueakTemp_cell := _gsSqueakTemp_cell nextCell].
			_gsSqueakTemp_anchor := _gsSqueakTemp_anchor + _gsSqueakTemp_yDist]