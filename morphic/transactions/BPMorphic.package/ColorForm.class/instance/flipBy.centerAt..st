scaling, rotation
flipBy: direction centerAt: aPoint 
	| _gsSqueakTemp_oldColors _gsSqueakTemp_newForm |
	_gsSqueakTemp_oldColors := colors.
	self colors: nil.
	_gsSqueakTemp_newForm := super flipBy: direction centerAt: aPoint.
	self colors: _gsSqueakTemp_oldColors.
	_gsSqueakTemp_newForm colors: _gsSqueakTemp_oldColors.
	^ _gsSqueakTemp_newForm