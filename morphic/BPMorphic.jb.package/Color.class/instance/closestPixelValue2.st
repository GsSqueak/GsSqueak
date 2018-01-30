conversions
closestPixelValue2
	"Return the nearest approximation to this color for a 2-bit deep Form."
	"fast special cases"
	| _gsSqueakTemp_lum |
	rgb = 0
		ifTrue: [^ 1].
	"black"
	rgb = 1073741823
		ifTrue: [^ 2].
	"opaque white"
	_gsSqueakTemp_lum := self luminance.
	_gsSqueakTemp_lum < 0.2
		ifTrue: [^ 1].
	"black"
	_gsSqueakTemp_lum > 0.6
		ifTrue: [^ 2].
	"opaque white"
	^ 3"50% gray"