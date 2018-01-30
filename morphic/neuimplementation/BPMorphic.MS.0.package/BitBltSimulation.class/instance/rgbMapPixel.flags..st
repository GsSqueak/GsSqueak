color mapping
rgbMapPixel: sourcePixel flags: mapperFlags 
	"Perform the RGBA conversion for the given source pixel"
	| _gsSqueakTemp_val |
	<inline: true>
	_gsSqueakTemp_val := (sourcePixel
				bitAnd: (cmMaskTable at: 0))
				bitShift: (cmShiftTable at: 0).
	_gsSqueakTemp_val := _gsSqueakTemp_val
				bitOr: ((sourcePixel
						bitAnd: (cmMaskTable at: 1))
						bitShift: (cmShiftTable at: 1)).
	_gsSqueakTemp_val := _gsSqueakTemp_val
				bitOr: ((sourcePixel
						bitAnd: (cmMaskTable at: 2))
						bitShift: (cmShiftTable at: 2)).
	^ _gsSqueakTemp_val
		bitOr: ((sourcePixel
				bitAnd: (cmMaskTable at: 3))
				bitShift: (cmShiftTable at: 3))