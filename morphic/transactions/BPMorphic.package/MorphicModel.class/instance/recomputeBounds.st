geometry
recomputeBounds
	| _gsSqueakTemp_bnds |
	_gsSqueakTemp_bnds := submorphs first bounds.
	bounds := _gsSqueakTemp_bnds origin corner: _gsSqueakTemp_bnds corner.
	"copy it!"
	fullBounds := nil.
	bounds := self fullBounds