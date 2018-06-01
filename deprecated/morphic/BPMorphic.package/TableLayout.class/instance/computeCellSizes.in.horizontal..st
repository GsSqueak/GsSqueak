layout
computeCellSizes: aMorph in: newBounds horizontal: aBool 
	"Step 1: Compute the minimum extent for all the children of aMorph"
	| _gsSqueakTemp_cells _gsSqueakTemp_block _gsSqueakTemp_minSize _gsSqueakTemp_maxSize _gsSqueakTemp_maxCell |
	_gsSqueakTemp_cells := WriteStream
				on: (Array new: aMorph submorphCount).
	_gsSqueakTemp_minSize := properties minCellSize asPoint.
	_gsSqueakTemp_maxSize := properties maxCellSize asPoint.
	aBool
		ifTrue: [_gsSqueakTemp_minSize := _gsSqueakTemp_minSize transposed.
			_gsSqueakTemp_maxSize := _gsSqueakTemp_maxSize transposed].
	_gsSqueakTemp_maxCell := 0 @ 0.
	_gsSqueakTemp_block := [:m | | size cell | m disableTableLayout
				ifFalse: [size := m minExtent asIntegerPoint.
					cell := LayoutCell new target: m.
					aBool
						ifTrue: [cell hSpaceFill: m hResizing == #spaceFill.
							cell vSpaceFill: m vResizing == #spaceFill]
						ifFalse: [cell hSpaceFill: m vResizing == #spaceFill.
							cell vSpaceFill: m hResizing == #spaceFill.
							size := size transposed].
					size := (size min: _gsSqueakTemp_maxSize)
								max: _gsSqueakTemp_minSize.
					cell cellSize: size.
					_gsSqueakTemp_maxCell := _gsSqueakTemp_maxCell max: size.
					_gsSqueakTemp_cells nextPut: cell]].
	properties reverseTableCells
		ifTrue: [aMorph submorphsReverseDo: _gsSqueakTemp_block]
		ifFalse: [aMorph submorphsDo: _gsSqueakTemp_block].
	^ _gsSqueakTemp_maxCell -> _gsSqueakTemp_cells contents