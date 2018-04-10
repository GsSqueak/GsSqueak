geometry
position: aPoint 
	"Overridden to align submorph origins to the grid if gridding is on."
	| _gsSqueakTemp_adjustedPosition _gsSqueakTemp_delta _gsSqueakTemp_box |
	_gsSqueakTemp_adjustedPosition := aPoint.
	temporaryCursor
		ifNotNil: [_gsSqueakTemp_adjustedPosition := (self griddedPoint: _gsSqueakTemp_adjustedPosition)
						+ temporaryCursorOffset].
	"Copied from Morph to avoid owner layoutChanged"
	"Change the position of this morph and and all of its submorphs."
	_gsSqueakTemp_delta := _gsSqueakTemp_adjustedPosition - bounds topLeft.
	_gsSqueakTemp_delta isZero
		ifTrue: [^ self].
	"Null change"
	_gsSqueakTemp_box := self fullBounds.
	(_gsSqueakTemp_delta dotProduct: _gsSqueakTemp_delta)
			> 100
		ifTrue: ["e.g., more than 10 pixels moved"
			self invalidRect: _gsSqueakTemp_box.
			self
				invalidRect: (_gsSqueakTemp_box translateBy: _gsSqueakTemp_delta)]
		ifFalse: [self
				invalidRect: (_gsSqueakTemp_box
						merge: (_gsSqueakTemp_box translateBy: _gsSqueakTemp_delta))].
	self privateFullMoveBy: _gsSqueakTemp_delta