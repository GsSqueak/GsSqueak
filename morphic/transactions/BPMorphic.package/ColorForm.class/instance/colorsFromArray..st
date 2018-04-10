accessing
colorsFromArray: colorArray 
	| _gsSqueakTemp_colorList |
	_gsSqueakTemp_colorList := colorArray
				collect: [:colorDef | Color fromArray: colorDef].
	self colors: _gsSqueakTemp_colorList