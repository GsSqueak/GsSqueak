colormaps
computeRGBColormapFor: destDepth bitsPerColor: bitsPerColor 
	"Compute a colorMap for translating from 16-bit or 32-bit RGB color to
	the given depth, using the given number of of bits per color
	component. "
	| _gsSqueakTemp_mask _gsSqueakTemp_map _gsSqueakTemp_c |
	(#(3 4 5 ) includes: bitsPerColor)
		ifFalse: [self error: 'BitBlt only supports 3, 4, or 5 bits per color component'].
	_gsSqueakTemp_mask := (1 bitShift: bitsPerColor)
				- 1.
	_gsSqueakTemp_map := Bitmap
				new: (1 bitShift: 3 * bitsPerColor).
	0
		to: _gsSqueakTemp_map size - 1
		do: [:i | 
			_gsSqueakTemp_c := Color
						r: ((i bitShift: 0 - (2 * bitsPerColor))
								bitAnd: _gsSqueakTemp_mask)
						g: ((i bitShift: 0 - bitsPerColor)
								bitAnd: _gsSqueakTemp_mask)
						b: ((i bitShift: 0)
								bitAnd: _gsSqueakTemp_mask)
						range: _gsSqueakTemp_mask.
			_gsSqueakTemp_map
				at: i + 1
				put: (_gsSqueakTemp_c pixelValueForDepth: destDepth)].
	_gsSqueakTemp_map
		at: 1
		put: (Color transparent pixelWordForDepth: destDepth).
	"zero always transparent"
	^ _gsSqueakTemp_map