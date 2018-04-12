preferences
roundedButtonCorners: aBoolean 
	| _gsSqueakTemp_world |
	RoundedButtonCorners := aBoolean.
	_gsSqueakTemp_world := Project current world.
	_gsSqueakTemp_world invalidRect: _gsSqueakTemp_world bounds from: _gsSqueakTemp_world