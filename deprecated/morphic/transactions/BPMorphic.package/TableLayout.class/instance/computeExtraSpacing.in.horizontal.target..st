layout
computeExtraSpacing: arrangement in: newBounds horizontal: aBool target: aMorph 
	"Compute the required extra spacing for laying out the cells"
	"match newBounds extent with arrangement's orientation"
	| _gsSqueakTemp_extent _gsSqueakTemp_extra _gsSqueakTemp_centering _gsSqueakTemp_n _gsSqueakTemp_extraPerCell _gsSqueakTemp_cell _gsSqueakTemp_last _gsSqueakTemp_hFill _gsSqueakTemp_vFill _gsSqueakTemp_max _gsSqueakTemp_amount _gsSqueakTemp_allow |
	_gsSqueakTemp_extent := newBounds extent.
	aBool
		ifFalse: [_gsSqueakTemp_extent := _gsSqueakTemp_extent transposed].
	"figure out if we have any horizontal or vertical space fillers"
	_gsSqueakTemp_hFill := _gsSqueakTemp_vFill := false.
	_gsSqueakTemp_max := 0 @ 0.
	arrangement
		do: [:c | 
			_gsSqueakTemp_max := (_gsSqueakTemp_max x max: c cellSize x)
						@ (_gsSqueakTemp_max y + c cellSize y).
			_gsSqueakTemp_max := _gsSqueakTemp_max max: c cellSize.
			_gsSqueakTemp_hFill := _gsSqueakTemp_hFill
						or: [c hSpaceFill].
			_gsSqueakTemp_vFill := _gsSqueakTemp_vFill
						or: [c vSpaceFill]].
	"Take client's shrink wrap constraints into account.
	Note: these are only honored when there are no #spaceFill children,
	or when #rubberBandCells is set."
	_gsSqueakTemp_allow := properties rubberBandCells not.
	aMorph hResizing == #shrinkWrap
		ifTrue: [aBool
				ifTrue: [_gsSqueakTemp_allow & _gsSqueakTemp_hFill
						ifFalse: [_gsSqueakTemp_extent := _gsSqueakTemp_max x
										@ (_gsSqueakTemp_max y max: _gsSqueakTemp_extent y)]]
				ifFalse: [_gsSqueakTemp_allow & _gsSqueakTemp_vFill
						ifFalse: [_gsSqueakTemp_extent := (_gsSqueakTemp_max x max: _gsSqueakTemp_extent x)
										@ _gsSqueakTemp_max y]]].
	aMorph vResizing == #shrinkWrap
		ifTrue: [aBool
				ifTrue: [_gsSqueakTemp_allow & _gsSqueakTemp_vFill
						ifFalse: [_gsSqueakTemp_extent := (_gsSqueakTemp_max x max: _gsSqueakTemp_extent x)
										@ _gsSqueakTemp_max y]]
				ifFalse: [_gsSqueakTemp_allow & _gsSqueakTemp_hFill
						ifFalse: [_gsSqueakTemp_extent := _gsSqueakTemp_max x
										@ (_gsSqueakTemp_max y max: _gsSqueakTemp_extent y)]]].
	"Now compute the extra v space"
	_gsSqueakTemp_extra := _gsSqueakTemp_extent y
				- (arrangement
						inject: 0
						into: [:sum :c | sum + c cellSize y]).
	_gsSqueakTemp_extra > 0
		ifTrue: ["Check if we have any #spaceFillers"
			_gsSqueakTemp_vFill
				ifTrue: ["use only #spaceFillers"
					_gsSqueakTemp_n := arrangement
								inject: 0
								into: [:sum :c | c vSpaceFill
										ifTrue: [sum + 1]
										ifFalse: [sum]].
					_gsSqueakTemp_n isZero
						ifFalse: [_gsSqueakTemp_extraPerCell := _gsSqueakTemp_extra asFloat / _gsSqueakTemp_n asFloat].
					_gsSqueakTemp_extra := _gsSqueakTemp_last := 0.
					arrangement
						do: [:c | c vSpaceFill
								ifTrue: [_gsSqueakTemp_extra := (_gsSqueakTemp_last := _gsSqueakTemp_extra) + _gsSqueakTemp_extraPerCell.
									_gsSqueakTemp_amount := 0 @ (_gsSqueakTemp_extra truncated - _gsSqueakTemp_last truncated).
									c
										do: [:cc | cc cellSize: cc cellSize + _gsSqueakTemp_amount]]]]
				ifFalse: ["no #spaceFillers; distribute regularly"
					_gsSqueakTemp_centering := properties wrapCentering.
					"centering == #topLeft ifTrue:[]."
					"add all extra space to the last cell; e.g., do nothing"
					_gsSqueakTemp_centering == #bottomRight
						ifTrue: ["add all extra space to the first cell"
							arrangement first addExtraSpace: 0 @ _gsSqueakTemp_extra].
					_gsSqueakTemp_centering == #center
						ifTrue: ["add 1/2 extra space to the first and last cell"
							arrangement first addExtraSpace: 0 @ (_gsSqueakTemp_extra // 2)].
					_gsSqueakTemp_centering == #justified
						ifTrue: ["add extra space equally distributed to each
							cell "
							_gsSqueakTemp_n := arrangement size - 1 max: 1.
							_gsSqueakTemp_extraPerCell := _gsSqueakTemp_extra asFloat / _gsSqueakTemp_n asFloat.
							_gsSqueakTemp_extra := _gsSqueakTemp_last := 0.
							arrangement
								do: [:c | 
									c addExtraSpace: 0 @ (_gsSqueakTemp_extra truncated - _gsSqueakTemp_last truncated).
									_gsSqueakTemp_extra := (_gsSqueakTemp_last := _gsSqueakTemp_extra) + _gsSqueakTemp_extraPerCell]]]].
	"Now compute the extra space for the primary direction"
	_gsSqueakTemp_centering := properties listCentering.
	1
		to: arrangement size
		do: [:i | 
			_gsSqueakTemp_cell := arrangement at: i.
			_gsSqueakTemp_extra := _gsSqueakTemp_extent x - _gsSqueakTemp_cell cellSize x.
			_gsSqueakTemp_extra > 0
				ifTrue: ["Check if we have any #spaceFillers"
					_gsSqueakTemp_cell := _gsSqueakTemp_cell nextCell.
					_gsSqueakTemp_cell hSpaceFill
						ifTrue: ["use only #spaceFillers"
							_gsSqueakTemp_n := _gsSqueakTemp_cell
										inject: 0
										into: [:sum :c | c hSpaceFill
												ifTrue: [sum + c target spaceFillWeight]
												ifFalse: [sum]].
							_gsSqueakTemp_n isZero
								ifFalse: [_gsSqueakTemp_extraPerCell := _gsSqueakTemp_extra asFloat / _gsSqueakTemp_n asFloat].
							_gsSqueakTemp_extra := _gsSqueakTemp_last := 0.
							_gsSqueakTemp_cell
								do: [:c | c hSpaceFill
										ifTrue: [_gsSqueakTemp_extra := (_gsSqueakTemp_last := _gsSqueakTemp_extra) + (_gsSqueakTemp_extraPerCell * c target spaceFillWeight).
											_gsSqueakTemp_amount := _gsSqueakTemp_extra truncated - _gsSqueakTemp_last truncated.
											c cellSize: c cellSize + (_gsSqueakTemp_amount @ 0)]]]
						ifFalse: ["no #spaceFiller; distribute regularly"
							"centering == #topLeft ifTrue:[]"
							"add all extra space to the last cell; e.g., do
							nothing "
							_gsSqueakTemp_centering == #bottomRight
								ifTrue: ["add all extra space to the first cell"
									_gsSqueakTemp_cell addExtraSpace: _gsSqueakTemp_extra @ 0].
							_gsSqueakTemp_centering == #center
								ifTrue: ["add 1/2 extra space to the first and
									last cell"
									_gsSqueakTemp_cell addExtraSpace: _gsSqueakTemp_extra // 2 @ 0].
							_gsSqueakTemp_centering == #justified
								ifTrue: ["add extra space equally distributed to
									each cell"
									_gsSqueakTemp_n := _gsSqueakTemp_cell size - 1 max: 1.
									_gsSqueakTemp_extraPerCell := _gsSqueakTemp_extra asFloat / _gsSqueakTemp_n asFloat.
									_gsSqueakTemp_extra := _gsSqueakTemp_last := 0.
									_gsSqueakTemp_cell
										do: [:c | 
											c addExtraSpace: _gsSqueakTemp_extra truncated - _gsSqueakTemp_last truncated @ 0.
											_gsSqueakTemp_extra := (_gsSqueakTemp_last := _gsSqueakTemp_extra) + _gsSqueakTemp_extraPerCell]]]]]