colormaps
computeColormapFrom: sourceDepth to: destDepth 
	"Compute a colorMap for translating between the given depths. A
	colormap is a Bitmap whose entries contain the pixel values for the
	destination depth. Typical clients use cachedColormapFrom:to:
	instead. "
	| _gsSqueakTemp_map _gsSqueakTemp_bitsPerColor |
	sourceDepth < 16
		ifTrue: ["source is 1-, 2-, 4-, or 8-bit indexed color"
			_gsSqueakTemp_map := (IndexedColors
						copyFrom: 1
						to: (1 bitShift: sourceDepth))
						collect: [:c | c pixelValueForDepth: destDepth].
			_gsSqueakTemp_map := _gsSqueakTemp_map as: Bitmap]
		ifFalse: ["source is 16-bit or 32-bit RGB"
			destDepth > 8
				ifTrue: [_gsSqueakTemp_bitsPerColor := 5
					"retain maximum color resolution"]
				ifFalse: [_gsSqueakTemp_bitsPerColor := 4].
			_gsSqueakTemp_map := self computeRGBColormapFor: destDepth bitsPerColor: _gsSqueakTemp_bitsPerColor].
	"Note: zero is transparent except when source depth is one-bit deep"
	sourceDepth > 1
		ifTrue: [_gsSqueakTemp_map at: 1 put: 0].
	^ _gsSqueakTemp_map