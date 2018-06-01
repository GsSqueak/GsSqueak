target resize
apply: delta 
	| _gsSqueakTemp_oldBounds |
	_gsSqueakTemp_oldBounds := target bounds.
	target
		bounds: (_gsSqueakTemp_oldBounds origin + (0 @ delta y) corner: _gsSqueakTemp_oldBounds corner)