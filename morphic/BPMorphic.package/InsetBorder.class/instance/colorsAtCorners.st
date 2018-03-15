accessing
colorsAtCorners
	| _gsSqueakTemp_c _gsSqueakTemp_c14 _gsSqueakTemp_c23 |
	_gsSqueakTemp_c := self color.
	_gsSqueakTemp_c14 := _gsSqueakTemp_c lighter.
	_gsSqueakTemp_c23 := _gsSqueakTemp_c darker.
	^ Array
		with: _gsSqueakTemp_c23
		with: _gsSqueakTemp_c14
		with: _gsSqueakTemp_c14
		with: _gsSqueakTemp_c23