color from user
oldColorPaletteForDepth: depth extent: paletteExtent 
	"Returns a form of the given size showing a color palette for the given
	depth. "
	"(Color oldColorPaletteForDepth: Display depth extent: 720@100)
	display "
	| _gsSqueakTemp_c _gsSqueakTemp_p _gsSqueakTemp_f _gsSqueakTemp_nSteps _gsSqueakTemp_rect _gsSqueakTemp_w _gsSqueakTemp_h _gsSqueakTemp_q |
	_gsSqueakTemp_f := Form extent: paletteExtent depth: depth.
	_gsSqueakTemp_f fill: _gsSqueakTemp_f boundingBox fillColor: Color white.
	_gsSqueakTemp_nSteps := depth > 8
				ifTrue: [12]
				ifFalse: [6].
	_gsSqueakTemp_w := paletteExtent x // (_gsSqueakTemp_nSteps * _gsSqueakTemp_nSteps).
	_gsSqueakTemp_h := paletteExtent y - 20 // _gsSqueakTemp_nSteps.
	0
		to: _gsSqueakTemp_nSteps - 1
		do: [:r | 0
				to: _gsSqueakTemp_nSteps - 1
				do: [:g | 0
						to: _gsSqueakTemp_nSteps - 1
						do: [:b | 
							_gsSqueakTemp_c := Color
										r: r
										g: g
										b: b
										range: _gsSqueakTemp_nSteps - 1.
							_gsSqueakTemp_rect := r * _gsSqueakTemp_nSteps * _gsSqueakTemp_w + (b * _gsSqueakTemp_w) @ (g * _gsSqueakTemp_h) extent: _gsSqueakTemp_w @ (_gsSqueakTemp_h + 1).
							_gsSqueakTemp_f fill: _gsSqueakTemp_rect fillColor: _gsSqueakTemp_c]]].
	_gsSqueakTemp_q := Quadrangle origin: paletteExtent - (50 @ 19) corner: paletteExtent.
	_gsSqueakTemp_q displayOn: _gsSqueakTemp_f.
	'Trans.' displayOn: _gsSqueakTemp_f at: _gsSqueakTemp_q origin + (9 @ 1).
	_gsSqueakTemp_w := paletteExtent x - _gsSqueakTemp_q width - 130 // 64 max: 1.
	_gsSqueakTemp_p := paletteExtent x - _gsSqueakTemp_q width - (64 * _gsSqueakTemp_w) - 1 @ (paletteExtent y - 19).
	0
		to: 63
		do: [:v | 
			_gsSqueakTemp_c := Color
						r: v
						g: v
						b: v
						range: 63.
			_gsSqueakTemp_f
				fill: (v * _gsSqueakTemp_w @ 0 + _gsSqueakTemp_p extent: _gsSqueakTemp_w + 1 @ 19)
				fillColor: _gsSqueakTemp_c].
	^ _gsSqueakTemp_f