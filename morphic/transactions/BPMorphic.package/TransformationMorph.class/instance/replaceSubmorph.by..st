submorphs-add/remove
replaceSubmorph: oldMorph by: newMorph 
	| _gsSqueakTemp_t _gsSqueakTemp_b |
	_gsSqueakTemp_t := transform.
	_gsSqueakTemp_b := bounds.
	super replaceSubmorph: oldMorph by: newMorph.
	transform := _gsSqueakTemp_t.
	bounds := _gsSqueakTemp_b.
	self layoutChanged