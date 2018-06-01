transformations
mixed: proportion with: aColor 
	"Mix with another color and do not preserve transpareny. Only use this
	for extracting the RGB value and mixing it. All other callers should use
	instead: 
	aColor alphaMixed: proportion with: anotherColor
	"
	| _gsSqueakTemp_frac1 _gsSqueakTemp_frac2 |
	_gsSqueakTemp_frac1 := proportion asFloat min: 1.0 max: 0.0.
	_gsSqueakTemp_frac2 := 1.0 - _gsSqueakTemp_frac1.
	^ Color
		r: self red * _gsSqueakTemp_frac1 + (aColor red * _gsSqueakTemp_frac2)
		g: self green * _gsSqueakTemp_frac1 + (aColor green * _gsSqueakTemp_frac2)
		b: self blue * _gsSqueakTemp_frac1 + (aColor blue * _gsSqueakTemp_frac2)