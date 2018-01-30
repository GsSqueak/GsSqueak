other
pixelScreenForDepth: depth 
	"Return a 50% stipple containing alternating pixels of all-zeros and
	all-ones to be used as a mask at the given depth."
	| _gsSqueakTemp_mask _gsSqueakTemp_bits |
	_gsSqueakTemp_mask := (1 bitShift: depth)
				- 1.
	_gsSqueakTemp_bits := 2 * depth.
	[_gsSqueakTemp_bits >= 32]
		whileFalse: [_gsSqueakTemp_mask := _gsSqueakTemp_mask
						bitOr: (_gsSqueakTemp_mask bitShift: _gsSqueakTemp_bits).
			"double the length of mask"
			_gsSqueakTemp_bits := _gsSqueakTemp_bits + _gsSqueakTemp_bits].
	^ Bitmap with: _gsSqueakTemp_mask with: _gsSqueakTemp_mask bitInvert32