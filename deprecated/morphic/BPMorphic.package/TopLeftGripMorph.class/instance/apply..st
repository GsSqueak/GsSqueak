target resize
apply: delta 
	| _gsSqueakTemp_oldBounds |
	_gsSqueakTemp_oldBounds := target bounds.
	target
		bounds: (_gsSqueakTemp_oldBounds origin + delta corner: _gsSqueakTemp_oldBounds corner)