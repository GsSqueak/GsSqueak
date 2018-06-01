layout
minExtentOf: aMorph in: box 
	"Return the minimal size aMorph's children would require given the
	new bounds"
	| _gsSqueakTemp_cells _gsSqueakTemp_arrangement _gsSqueakTemp_horizontal _gsSqueakTemp_newBounds _gsSqueakTemp_minX _gsSqueakTemp_minY _gsSqueakTemp_dir |
	minExtentCache isNil
		ifFalse: [^ minExtentCache].
	aMorph hasSubmorphs
		ifFalse: [^ 0 @ 0].
	properties := aMorph assureTableProperties.
	(properties wrapDirection == #none
			and: [properties cellSpacing == #none])
		ifTrue: ["Get into the fast lane"
			_gsSqueakTemp_dir := properties listDirection.
			(_gsSqueakTemp_dir == #leftToRight
					or: [_gsSqueakTemp_dir == #rightToLeft])
				ifTrue: [^ self minExtentHorizontal: aMorph].
			(_gsSqueakTemp_dir == #topToBottom
					or: [_gsSqueakTemp_dir == #bottomToTop])
				ifTrue: [^ self minExtentVertical: aMorph]].
	_gsSqueakTemp_newBounds := box origin asIntegerPoint corner: box corner asIntegerPoint.
	_gsSqueakTemp_horizontal := (properties listDirection == #topToBottom
				or: [properties listDirection == #bottomToTop]) not.
	"Step 1: Compute the minimum extent for all the children of aMorph"
	_gsSqueakTemp_cells := self
				computeCellSizes: aMorph
				in: (0 @ 0 corner: _gsSqueakTemp_newBounds extent)
				horizontal: _gsSqueakTemp_horizontal.
	"Step 2: Compute the arrangement of the cells for each row and
	column "
	_gsSqueakTemp_arrangement := self
				computeCellArrangement: _gsSqueakTemp_cells
				in: _gsSqueakTemp_newBounds
				horizontal: _gsSqueakTemp_horizontal
				target: aMorph.
	"Step 3: Extract the minimum size out of the arrangement"
	_gsSqueakTemp_minX := _gsSqueakTemp_minY := 0.
	_gsSqueakTemp_arrangement
		do: [:cell | 
			_gsSqueakTemp_minX := _gsSqueakTemp_minX max: cell cellSize x + cell extraSpace x.
			_gsSqueakTemp_minY := _gsSqueakTemp_minY + cell cellSize y + cell extraSpace y].
	minExtentCache := _gsSqueakTemp_horizontal
				ifTrue: [_gsSqueakTemp_minX @ _gsSqueakTemp_minY]
				ifFalse: [_gsSqueakTemp_minY @ _gsSqueakTemp_minX].
	^ minExtentCache