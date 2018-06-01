layout
layout: aMorph in: box 
	"Compute the layout for the given morph based on the new bounds"
	| _gsSqueakTemp_cells _gsSqueakTemp_arrangement _gsSqueakTemp_horizontal _gsSqueakTemp_newBounds |
	aMorph hasSubmorphs
		ifFalse: [^ self].
	properties := aMorph assureTableProperties.
	_gsSqueakTemp_newBounds := box origin asIntegerPoint corner: box corner asIntegerPoint.
	(properties wrapDirection == #none
			and: [properties cellSpacing == #none])
		ifTrue: ["get into the fast lane"
			properties listCentering == #justified
				ifFalse: ["can't deal with that"
					properties listDirection == #leftToRight
						ifTrue: [^ self layoutLeftToRight: aMorph in: _gsSqueakTemp_newBounds].
					properties listDirection == #topToBottom
						ifTrue: [^ self layoutTopToBottom: aMorph in: _gsSqueakTemp_newBounds]]].
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
	"Step 3: Compute the extra spacing for each cell"
	self
		computeExtraSpacing: _gsSqueakTemp_arrangement
		in: _gsSqueakTemp_newBounds
		horizontal: _gsSqueakTemp_horizontal
		target: aMorph.
	"Step 4: Place the children within the cells accordingly"
	self
		placeCells: _gsSqueakTemp_arrangement
		in: _gsSqueakTemp_newBounds
		horizontal: _gsSqueakTemp_horizontal
		target: aMorph