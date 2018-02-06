transformations
duller
	"Answer a darker, desaturated color. If the original color isn't very
	saturated, desaturate it by less (otherwise will just end up with grey).
	If the original color is a grey, don't try to be smart."
	| _gsSqueakTemp_sat _gsSqueakTemp_adjust |
	(_gsSqueakTemp_sat := self saturation) > 0.3
		ifTrue: [_gsSqueakTemp_adjust := -0.1]
		ifFalse: [_gsSqueakTemp_adjust := 0.1 - _gsSqueakTemp_sat max: 0.0].
	^ _gsSqueakTemp_sat isZero
		ifTrue: [self adjustBrightness: -0.1]
		ifFalse: [self adjustSaturation: _gsSqueakTemp_adjust brightness: -0.1]