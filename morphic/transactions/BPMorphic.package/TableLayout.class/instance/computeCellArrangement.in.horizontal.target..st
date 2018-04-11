layout
computeCellArrangement: cellHolder in: newBounds horizontal: aBool target: aMorph 
	"Compute number of cells we can put in each row/column. The
	returned array contains a list of all the cells we can put into the
	row/column at each level.
	Note: The arrangement is so that the 'x' value of each cell advances
	along the list direction and the 'y' value along the wrap direction. The
	returned arrangement has an extra cell at the start describing the
	width and height of the row."
	| _gsSqueakTemp_cells _gsSqueakTemp_wrap _gsSqueakTemp_spacing _gsSqueakTemp_output _gsSqueakTemp_maxExtent _gsSqueakTemp_n _gsSqueakTemp_sum _gsSqueakTemp_index _gsSqueakTemp_max _gsSqueakTemp_cell _gsSqueakTemp_first _gsSqueakTemp_last _gsSqueakTemp_w _gsSqueakTemp_cellMax _gsSqueakTemp_maxCell _gsSqueakTemp_hFill _gsSqueakTemp_vFill _gsSqueakTemp_inset |
	_gsSqueakTemp_maxCell := cellHolder key.
	_gsSqueakTemp_cells := cellHolder value.
	properties wrapDirection == #none
		ifTrue: [_gsSqueakTemp_wrap := SmallInteger maxVal]
		ifFalse: [_gsSqueakTemp_wrap := aBool
						ifTrue: [newBounds width]
						ifFalse: [newBounds height].
			_gsSqueakTemp_wrap := _gsSqueakTemp_wrap max: _gsSqueakTemp_maxCell x].
	_gsSqueakTemp_spacing := properties cellSpacing.
	(_gsSqueakTemp_spacing == #globalRect
			or: [_gsSqueakTemp_spacing = #globalSquare])
		ifTrue: ["Globally equal spacing is a very special case here, so get out
			fast and easy"
			^ self
				computeGlobalCellArrangement: _gsSqueakTemp_cells
				in: newBounds
				horizontal: aBool
				wrap: _gsSqueakTemp_wrap
				spacing: _gsSqueakTemp_spacing].
	_gsSqueakTemp_output := WriteStream on: Array new.
	_gsSqueakTemp_inset := properties cellInset asPoint.
	aBool
		ifFalse: [_gsSqueakTemp_inset := _gsSqueakTemp_inset transposed].
	_gsSqueakTemp_first := _gsSqueakTemp_last := nil.
	_gsSqueakTemp_maxExtent := 0 @ 0.
	_gsSqueakTemp_sum := 0.
	_gsSqueakTemp_index := 1.
	_gsSqueakTemp_n := 0.
	_gsSqueakTemp_hFill := _gsSqueakTemp_vFill := false.
	[_gsSqueakTemp_index <= _gsSqueakTemp_cells size]
		whileTrue: [_gsSqueakTemp_w := _gsSqueakTemp_sum.
			_gsSqueakTemp_cell := _gsSqueakTemp_cells at: _gsSqueakTemp_index.
			_gsSqueakTemp_cellMax := _gsSqueakTemp_maxExtent max: _gsSqueakTemp_cell cellSize.
			"e.g., minSize"
			_gsSqueakTemp_sum := (_gsSqueakTemp_spacing == #localRect
							or: [_gsSqueakTemp_spacing == #localSquare])
						ifTrue: ["Recompute entire size of current row"
							_gsSqueakTemp_max := _gsSqueakTemp_spacing == #localSquare
										ifTrue: [_gsSqueakTemp_cellMax x max: _gsSqueakTemp_cellMax y]
										ifFalse: [_gsSqueakTemp_cellMax x].
							_gsSqueakTemp_n + 1 * _gsSqueakTemp_max]
						ifFalse: [_gsSqueakTemp_sum + _gsSqueakTemp_cell cellSize x].
			(_gsSqueakTemp_sum + (_gsSqueakTemp_n * _gsSqueakTemp_inset x) > _gsSqueakTemp_wrap
					and: [_gsSqueakTemp_first notNil])
				ifTrue: ["It doesn't fit and we're not starting a new line"
					(_gsSqueakTemp_spacing == #localSquare
							or: [_gsSqueakTemp_spacing == #localRect])
						ifTrue: [_gsSqueakTemp_spacing == #localSquare
								ifTrue: [_gsSqueakTemp_maxExtent := (_gsSqueakTemp_maxExtent x max: _gsSqueakTemp_maxExtent y) asPoint].
							_gsSqueakTemp_first
								do: [:c | c cellSize: _gsSqueakTemp_maxExtent]].
					_gsSqueakTemp_w := _gsSqueakTemp_w + (_gsSqueakTemp_n - 1 * _gsSqueakTemp_inset x).
					"redistribute extra space"
					_gsSqueakTemp_first nextCell
						ifNotNil: [_gsSqueakTemp_first nextCell
								do: [:c | c addExtraSpace: _gsSqueakTemp_inset x @ 0]].
					_gsSqueakTemp_last := LayoutCell new.
					_gsSqueakTemp_last cellSize: _gsSqueakTemp_w @ _gsSqueakTemp_maxExtent y.
					_gsSqueakTemp_last hSpaceFill: _gsSqueakTemp_hFill.
					_gsSqueakTemp_last vSpaceFill: _gsSqueakTemp_vFill.
					_gsSqueakTemp_last nextCell: _gsSqueakTemp_first.
					_gsSqueakTemp_output position = 0
						ifFalse: [_gsSqueakTemp_last addExtraSpace: 0 @ _gsSqueakTemp_inset y].
					_gsSqueakTemp_output nextPut: _gsSqueakTemp_last.
					_gsSqueakTemp_first := nil.
					_gsSqueakTemp_maxExtent := 0 @ 0.
					_gsSqueakTemp_sum := 0.
					_gsSqueakTemp_n := 0.
					_gsSqueakTemp_hFill := _gsSqueakTemp_vFill := false]
				ifFalse: ["It did fit; use next item from input"
					_gsSqueakTemp_first
						ifNil: [_gsSqueakTemp_first := _gsSqueakTemp_last := _gsSqueakTemp_cell]
						ifNotNil: [_gsSqueakTemp_last nextCell: _gsSqueakTemp_cell.
							_gsSqueakTemp_last := _gsSqueakTemp_cell].
					_gsSqueakTemp_index := _gsSqueakTemp_index + 1.
					_gsSqueakTemp_n := _gsSqueakTemp_n + 1.
					_gsSqueakTemp_maxExtent := _gsSqueakTemp_cellMax.
					_gsSqueakTemp_hFill := _gsSqueakTemp_hFill
								or: [_gsSqueakTemp_cell hSpaceFill].
					_gsSqueakTemp_vFill := _gsSqueakTemp_vFill
								or: [_gsSqueakTemp_cell vSpaceFill]]].
	_gsSqueakTemp_first
		ifNotNil: [_gsSqueakTemp_last := LayoutCell new.
			_gsSqueakTemp_sum := _gsSqueakTemp_sum + (_gsSqueakTemp_n - 1 * _gsSqueakTemp_inset x).
			_gsSqueakTemp_first nextCell
				ifNotNil: [_gsSqueakTemp_first nextCell
						do: [:c | c addExtraSpace: _gsSqueakTemp_inset x @ 0]].
			_gsSqueakTemp_last cellSize: _gsSqueakTemp_sum @ _gsSqueakTemp_maxExtent y.
			_gsSqueakTemp_last hSpaceFill: _gsSqueakTemp_hFill.
			_gsSqueakTemp_last vSpaceFill: _gsSqueakTemp_vFill.
			_gsSqueakTemp_last nextCell: _gsSqueakTemp_first.
			_gsSqueakTemp_output position = 0
				ifFalse: [_gsSqueakTemp_last addExtraSpace: 0 @ _gsSqueakTemp_inset y].
			_gsSqueakTemp_output nextPut: _gsSqueakTemp_last].
	_gsSqueakTemp_output := _gsSqueakTemp_output contents.
	properties listSpacing == #equal
		ifTrue: ["Make all the heights equal"
			_gsSqueakTemp_max := _gsSqueakTemp_output
						inject: 0
						into: [:size :c | size max: c cellSize y].
			_gsSqueakTemp_output
				do: [:c | c cellSize: c cellSize x @ _gsSqueakTemp_max]].
	^ _gsSqueakTemp_output