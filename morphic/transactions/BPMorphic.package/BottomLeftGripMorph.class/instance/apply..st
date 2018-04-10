target resize
apply: delta 
	| _gsSqueakTemp_oldBounds |
	_gsSqueakTemp_oldBounds := target bounds.
	target
		bounds: (_gsSqueakTemp_oldBounds origin + (delta x @ 0) corner: _gsSqueakTemp_oldBounds corner + (0 @ delta y))