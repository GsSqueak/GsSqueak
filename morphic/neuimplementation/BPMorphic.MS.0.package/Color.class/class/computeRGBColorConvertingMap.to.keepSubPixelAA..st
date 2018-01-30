colormaps
computeRGBColorConvertingMap: targetColor to: destDepth keepSubPixelAA: keepSubPix 
	"Builds a colormap intended to convert from subpixelAA black values
	to targetColor values.
	keepSubPix
	ifTrue: [ Answer colors that also include subpixelAA ]
	ifFalse: [ 
	Take fullpixel luminance level. Apply it to targetColor.
	I.e. answer colors with NO subpixelAA ]"
	| _gsSqueakTemp_mask _gsSqueakTemp_map _gsSqueakTemp_c _gsSqueakTemp_bitsPerColor _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_f _gsSqueakTemp_v |
	destDepth > 8
		ifTrue: [_gsSqueakTemp_bitsPerColor := 5
			"retain maximum color resolution"]
		ifFalse: [_gsSqueakTemp_bitsPerColor := 4].
	"Usually a bit less is enough, but make it configurable"
	_gsSqueakTemp_bitsPerColor := _gsSqueakTemp_bitsPerColor min: Preferences aaFontsColormapDepth.
	_gsSqueakTemp_mask := (1 bitShift: _gsSqueakTemp_bitsPerColor)
				- 1.
	_gsSqueakTemp_map := Bitmap
				new: (1 bitShift: 3 * _gsSqueakTemp_bitsPerColor).
	0
		to: _gsSqueakTemp_map size - 1
		do: [:i | 
			_gsSqueakTemp_r := (i bitShift: 0 - (2 * _gsSqueakTemp_bitsPerColor))
						bitAnd: _gsSqueakTemp_mask.
			_gsSqueakTemp_g := (i bitShift: 0 - _gsSqueakTemp_bitsPerColor)
						bitAnd: _gsSqueakTemp_mask.
			_gsSqueakTemp_b := (i bitShift: 0)
						bitAnd: _gsSqueakTemp_mask.
			_gsSqueakTemp_f := 1.0 - (_gsSqueakTemp_r + _gsSqueakTemp_g + _gsSqueakTemp_b / 3.0 / _gsSqueakTemp_mask).
			_gsSqueakTemp_c := targetColor notNil
						ifTrue: [(keepSubPix
									and: [destDepth > 8])
								ifTrue: [Color
										r: 1.0 - (_gsSqueakTemp_r / _gsSqueakTemp_mask) * targetColor red
										g: 1.0 - (_gsSqueakTemp_g / _gsSqueakTemp_mask) * targetColor green
										b: 1.0 - (_gsSqueakTemp_b / _gsSqueakTemp_mask) * targetColor blue
										alpha: _gsSqueakTemp_f * targetColor alpha
									"alpha will be ignored below, in
									#pixelValueForDepth: if destDepth ~=
									32 "]
								ifFalse: [destDepth = 32
										ifTrue: [targetColor * _gsSqueakTemp_f alpha: _gsSqueakTemp_f * targetColor alpha]
										ifFalse: [targetColor alphaMixed: _gsSqueakTemp_f * 1.5 with: Color white]]]
						ifFalse: [Color
								r: _gsSqueakTemp_r
								g: _gsSqueakTemp_g
								b: _gsSqueakTemp_b
								range: _gsSqueakTemp_mask].
			"This is currently used only to keep some SubPixelAA on
			destDepth = 8, using a single pass of rule 25"
			_gsSqueakTemp_v := destDepth = 32
						ifTrue: [_gsSqueakTemp_c pixelValueForDepth: destDepth]
						ifFalse: [_gsSqueakTemp_f < 0.1
								ifTrue: [0]
								ifFalse: [_gsSqueakTemp_c pixelValueForDepth: destDepth]].
			_gsSqueakTemp_map at: i + 1 put: _gsSqueakTemp_v].
	^ _gsSqueakTemp_map