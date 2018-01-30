instance creation
fromColorref: aColorref 
	| _gsSqueakTemp_red _gsSqueakTemp_green _gsSqueakTemp_blue |
	_gsSqueakTemp_red := aColorref bitAnd: 255.
	_gsSqueakTemp_green := (aColorref bitAnd: 65280)
				>> 8.
	_gsSqueakTemp_blue := (aColorref bitAnd: 16711680)
				>> 16.
	^ self
		r: _gsSqueakTemp_red
		g: _gsSqueakTemp_green
		b: _gsSqueakTemp_blue
		range: 255