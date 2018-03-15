optimized
minExtentVertical: aMorph 
	"Return the minimal size aMorph's children would require given the
	new bounds"
	| _gsSqueakTemp_inset _gsSqueakTemp_minX _gsSqueakTemp_minY _gsSqueakTemp_maxX _gsSqueakTemp_maxY _gsSqueakTemp_n _gsSqueakTemp_size _gsSqueakTemp_width _gsSqueakTemp_height |
	_gsSqueakTemp_size := properties minCellSize asPoint.
	_gsSqueakTemp_minX := _gsSqueakTemp_size x.
	_gsSqueakTemp_minY := _gsSqueakTemp_size y.
	_gsSqueakTemp_size := properties maxCellSize asPoint.
	_gsSqueakTemp_maxX := _gsSqueakTemp_size x.
	_gsSqueakTemp_maxY := _gsSqueakTemp_size y.
	_gsSqueakTemp_inset := properties cellInset asPoint.
	_gsSqueakTemp_n := 0.
	_gsSqueakTemp_width := _gsSqueakTemp_height := 0.
	aMorph
		submorphsDo: [:m | | sizeY sizeX | m disableTableLayout
				ifFalse: [_gsSqueakTemp_n := _gsSqueakTemp_n + 1.
					_gsSqueakTemp_size := m minExtent.
					sizeX := _gsSqueakTemp_size x.
					sizeY := _gsSqueakTemp_size y.
					sizeX < _gsSqueakTemp_minX
						ifTrue: [sizeX := _gsSqueakTemp_minX]
						ifFalse: [sizeX := sizeX min: _gsSqueakTemp_maxX].
					sizeY < _gsSqueakTemp_minY
						ifTrue: [sizeY := _gsSqueakTemp_minY]
						ifFalse: [sizeY := sizeY min: _gsSqueakTemp_maxY].
					_gsSqueakTemp_height := _gsSqueakTemp_height + sizeY.
					sizeX > _gsSqueakTemp_width
						ifTrue: [_gsSqueakTemp_width := sizeX]]].
	_gsSqueakTemp_n > 1
		ifTrue: [_gsSqueakTemp_height := _gsSqueakTemp_height + (_gsSqueakTemp_n - 1 * _gsSqueakTemp_inset y)].
	^ minExtentCache := _gsSqueakTemp_width @ _gsSqueakTemp_height