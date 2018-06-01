layout
computeGlobalCellArrangement: cells in: newBounds horizontal: aBool wrap: wrap spacing: spacing 
	"Compute number of cells we can put in each row/column. The
	returned array contains a list of all the cells we can put into the
	row/column at each level.
	Note: The arrangement is so that the 'x' value of each cell advances
	along the list direction and the 'y' value along the wrap direction. The
	returned arrangement has an extra cell at the start describing the
	width and height of the row."
	| _gsSqueakTemp_output _gsSqueakTemp_maxExtent _gsSqueakTemp_n _gsSqueakTemp_cell _gsSqueakTemp_first _gsSqueakTemp_last _gsSqueakTemp_hFill _gsSqueakTemp_vFill |
	_gsSqueakTemp_output := WriteStream on: Array new.
	_gsSqueakTemp_first := _gsSqueakTemp_last := nil.
	_gsSqueakTemp_maxExtent := cells
				inject: 0 @ 0
				into: [:size :c | size max: c cellSize
					"e.g., minSize"].
	spacing == #globalSquare
		ifTrue: [_gsSqueakTemp_maxExtent := (_gsSqueakTemp_maxExtent x max: _gsSqueakTemp_maxExtent y) asPoint].
	_gsSqueakTemp_n := wrap // _gsSqueakTemp_maxExtent x max: 1.
	_gsSqueakTemp_hFill := _gsSqueakTemp_vFill := false.
	1
		to: cells size
		do: [:i | 
			_gsSqueakTemp_cell := cells at: i.
			_gsSqueakTemp_hFill := _gsSqueakTemp_hFill
						or: [_gsSqueakTemp_cell hSpaceFill].
			_gsSqueakTemp_vFill := _gsSqueakTemp_vFill
						or: [_gsSqueakTemp_cell vSpaceFill].
			_gsSqueakTemp_cell cellSize: _gsSqueakTemp_maxExtent.
			_gsSqueakTemp_first
				ifNil: [_gsSqueakTemp_first := _gsSqueakTemp_last := _gsSqueakTemp_cell]
				ifNotNil: [_gsSqueakTemp_last nextCell: _gsSqueakTemp_cell.
					_gsSqueakTemp_last := _gsSqueakTemp_cell].
			i \\ _gsSqueakTemp_n = 0
				ifTrue: [_gsSqueakTemp_last := LayoutCell new.
					_gsSqueakTemp_last cellSize: _gsSqueakTemp_maxExtent x * _gsSqueakTemp_n @ _gsSqueakTemp_maxExtent y.
					_gsSqueakTemp_last hSpaceFill: _gsSqueakTemp_hFill.
					_gsSqueakTemp_last vSpaceFill: _gsSqueakTemp_vFill.
					_gsSqueakTemp_hFill := _gsSqueakTemp_vFill := false.
					_gsSqueakTemp_last nextCell: _gsSqueakTemp_first.
					_gsSqueakTemp_output nextPut: _gsSqueakTemp_last.
					_gsSqueakTemp_first := nil]].
	_gsSqueakTemp_first
		ifNotNil: [_gsSqueakTemp_last := LayoutCell new.
			_gsSqueakTemp_last cellSize: _gsSqueakTemp_maxExtent x * _gsSqueakTemp_n @ _gsSqueakTemp_maxExtent y.
			self flag: #arNote.
			"@@@: n is not correct!"
			_gsSqueakTemp_last nextCell: _gsSqueakTemp_first.
			_gsSqueakTemp_output nextPut: _gsSqueakTemp_last].
	^ _gsSqueakTemp_output contents