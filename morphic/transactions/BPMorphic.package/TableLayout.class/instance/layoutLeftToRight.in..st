optimized
layoutLeftToRight: aMorph in: newBounds 
	"An optimized left-to-right list layout"
	| _gsSqueakTemp_inset _gsSqueakTemp_extent _gsSqueakTemp_block _gsSqueakTemp_posX _gsSqueakTemp_posY _gsSqueakTemp_centering _gsSqueakTemp_extraPerCell _gsSqueakTemp_amount _gsSqueakTemp_minX _gsSqueakTemp_minY _gsSqueakTemp_maxX _gsSqueakTemp_maxY _gsSqueakTemp_n _gsSqueakTemp_width _gsSqueakTemp_extra _gsSqueakTemp_last _gsSqueakTemp_cell _gsSqueakTemp_size _gsSqueakTemp_height _gsSqueakTemp_sum _gsSqueakTemp_vFill _gsSqueakTemp_first |
	_gsSqueakTemp_size := properties minCellSize asPoint.
	_gsSqueakTemp_minX := _gsSqueakTemp_size x.
	_gsSqueakTemp_minY := _gsSqueakTemp_size y.
	_gsSqueakTemp_size := properties maxCellSize asPoint.
	_gsSqueakTemp_maxX := _gsSqueakTemp_size x.
	_gsSqueakTemp_maxY := _gsSqueakTemp_size y.
	_gsSqueakTemp_inset := properties cellInset asPoint x.
	_gsSqueakTemp_extent := newBounds extent.
	_gsSqueakTemp_n := 0.
	_gsSqueakTemp_vFill := false.
	_gsSqueakTemp_sum := 0.
	_gsSqueakTemp_width := _gsSqueakTemp_height := 0.
	_gsSqueakTemp_first := _gsSqueakTemp_last := nil.
	_gsSqueakTemp_block := [:m | 
			| sizeX props sizeY |
			props := m layoutProperties
						ifNil: [m].
			props disableTableLayout
				ifFalse: [_gsSqueakTemp_n := _gsSqueakTemp_n + 1.
					_gsSqueakTemp_cell := LayoutCell new target: m.
					props hResizing == #spaceFill
						ifTrue: [_gsSqueakTemp_cell hSpaceFill: true.
							_gsSqueakTemp_extra := m spaceFillWeight.
							_gsSqueakTemp_cell extraSpace: _gsSqueakTemp_extra.
							_gsSqueakTemp_sum := _gsSqueakTemp_sum + _gsSqueakTemp_extra]
						ifFalse: [_gsSqueakTemp_cell hSpaceFill: false].
					props vResizing == #spaceFill
						ifTrue: [_gsSqueakTemp_vFill := true].
					_gsSqueakTemp_size := m minExtent.
					_gsSqueakTemp_size := m minExtent.
					sizeX := _gsSqueakTemp_size x.
					sizeY := _gsSqueakTemp_size y.
					sizeX < _gsSqueakTemp_minX
						ifTrue: [sizeX := _gsSqueakTemp_minX]
						ifFalse: [sizeX := sizeX min: _gsSqueakTemp_maxX].
					sizeY < _gsSqueakTemp_minY
						ifTrue: [sizeY := _gsSqueakTemp_minY]
						ifFalse: [sizeY := sizeY min: _gsSqueakTemp_maxY].
					_gsSqueakTemp_cell cellSize: sizeX.
					_gsSqueakTemp_last
						ifNil: [_gsSqueakTemp_first := _gsSqueakTemp_cell]
						ifNotNil: [_gsSqueakTemp_last nextCell: _gsSqueakTemp_cell].
					_gsSqueakTemp_last := _gsSqueakTemp_cell.
					_gsSqueakTemp_width := _gsSqueakTemp_width + sizeX.
					sizeY > _gsSqueakTemp_height
						ifTrue: [_gsSqueakTemp_height := sizeY]]].
	properties reverseTableCells
		ifTrue: [aMorph submorphsReverseDo: _gsSqueakTemp_block]
		ifFalse: [aMorph submorphsDo: _gsSqueakTemp_block].
	_gsSqueakTemp_n > 1
		ifTrue: [_gsSqueakTemp_width := _gsSqueakTemp_width + (_gsSqueakTemp_n - 1 * _gsSqueakTemp_inset)].
	(properties hResizing == #shrinkWrap
			and: [properties rubberBandCells
					or: [_gsSqueakTemp_sum isZero]])
		ifTrue: [_gsSqueakTemp_extent := _gsSqueakTemp_width
						@ (_gsSqueakTemp_extent y max: _gsSqueakTemp_height)].
	(properties vResizing == #shrinkWrap
			and: [properties rubberBandCells
					or: [_gsSqueakTemp_vFill not]])
		ifTrue: [_gsSqueakTemp_extent := (_gsSqueakTemp_extent x max: _gsSqueakTemp_width)
						@ _gsSqueakTemp_height].
	_gsSqueakTemp_posX := newBounds left.
	_gsSqueakTemp_posY := newBounds top.
	"Compute extra vertical space"
	_gsSqueakTemp_extra := _gsSqueakTemp_extent y - _gsSqueakTemp_height.
	_gsSqueakTemp_extra := _gsSqueakTemp_extra max: 0.
	_gsSqueakTemp_extra > 0
		ifTrue: [_gsSqueakTemp_vFill
				ifTrue: [_gsSqueakTemp_height := _gsSqueakTemp_extent y]
				ifFalse: [_gsSqueakTemp_centering := properties wrapCentering.
					_gsSqueakTemp_centering == #bottomRight
						ifTrue: [_gsSqueakTemp_posY := _gsSqueakTemp_posY + _gsSqueakTemp_extra].
					_gsSqueakTemp_centering == #center
						ifTrue: [_gsSqueakTemp_posY := _gsSqueakTemp_posY + (_gsSqueakTemp_extra // 2)]]].
	"Compute extra horizontal space"
	_gsSqueakTemp_extra := _gsSqueakTemp_extent x - _gsSqueakTemp_width.
	_gsSqueakTemp_extra := _gsSqueakTemp_extra max: 0.
	_gsSqueakTemp_extraPerCell := 0.
	_gsSqueakTemp_extra > 0
		ifTrue: [_gsSqueakTemp_sum isZero
				ifTrue: ["extra space but no #spaceFillers"
					_gsSqueakTemp_centering := properties listCentering.
					_gsSqueakTemp_centering == #bottomRight
						ifTrue: [_gsSqueakTemp_posX := _gsSqueakTemp_posX + _gsSqueakTemp_extra].
					_gsSqueakTemp_centering == #center
						ifTrue: [_gsSqueakTemp_posX := _gsSqueakTemp_posX + (_gsSqueakTemp_extra // 2)]]
				ifFalse: [_gsSqueakTemp_extraPerCell := _gsSqueakTemp_extra asFloat / _gsSqueakTemp_sum asFloat]].
	_gsSqueakTemp_n := 0.
	_gsSqueakTemp_extra := _gsSqueakTemp_last := 0.
	_gsSqueakTemp_cell := _gsSqueakTemp_first.
	[_gsSqueakTemp_cell isNil]
		whileFalse: [_gsSqueakTemp_n := _gsSqueakTemp_n + 1.
			_gsSqueakTemp_width := _gsSqueakTemp_cell cellSize.
			(_gsSqueakTemp_extraPerCell > 0
					and: [_gsSqueakTemp_cell hSpaceFill])
				ifTrue: [_gsSqueakTemp_extra := (_gsSqueakTemp_last := _gsSqueakTemp_extra) + (_gsSqueakTemp_extraPerCell * _gsSqueakTemp_cell extraSpace).
					_gsSqueakTemp_amount := _gsSqueakTemp_extra truncated - _gsSqueakTemp_last truncated.
					_gsSqueakTemp_width := _gsSqueakTemp_width + _gsSqueakTemp_amount].
			_gsSqueakTemp_cell target
				layoutInBounds: (_gsSqueakTemp_posX @ _gsSqueakTemp_posY extent: _gsSqueakTemp_width @ _gsSqueakTemp_height).
			_gsSqueakTemp_posX := _gsSqueakTemp_posX + _gsSqueakTemp_width + _gsSqueakTemp_inset.
			_gsSqueakTemp_cell := _gsSqueakTemp_cell nextCell]