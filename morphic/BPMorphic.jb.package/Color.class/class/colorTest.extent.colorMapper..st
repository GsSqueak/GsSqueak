color from user
colorTest: depth extent: chartExtent colorMapper: colorMapper 
	"Create a palette of colors sorted horizontally by hue and vertically by
	lightness. Useful for eyeballing the color gamut of the display, or for
	choosing a color interactively."
	"Note: It is slow to build this palette, so it should be cached for quick
	access. "
	"(Color colorTest: 32 extent: 570@180 colorMapper: [:c | c]) display"
	"(Color colorTest: 32 extent: 570@180 colorMapper:
	[:c | Color
	r: (c red * 7) asInteger / 7
	g: (c green * 7) asInteger / 7
	b: (c blue * 3) asInteger / 3]) display"
	"(Color colorTest: 32 extent: 570@180 colorMapper:
	[:c | Color
	r: (c red * 5) asInteger / 5
	g: (c green * 5) asInteger / 5
	b: (c blue * 5) asInteger / 5]) display"
	"(Color colorTest: 32 extent: 570@180 colorMapper:
	[:c | Color
	r: (c red * 15) asInteger / 15
	g: (c green * 15) asInteger / 15
	b: (c blue * 15) asInteger / 15]) display"
	"(Color colorTest: 32 extent: 570@180 colorMapper:
	[:c | Color
	r: (c red * 31) asInteger / 31
	g: (c green * 31) asInteger / 31
	b: (c blue * 31) asInteger / 31]) display"
	| _gsSqueakTemp_startHue _gsSqueakTemp_palette _gsSqueakTemp_transHt _gsSqueakTemp_vSteps _gsSqueakTemp_transCaption _gsSqueakTemp_grayWidth _gsSqueakTemp_hSteps _gsSqueakTemp_y _gsSqueakTemp_c _gsSqueakTemp_x |
	_gsSqueakTemp_palette := Form extent: chartExtent depth: depth.
	_gsSqueakTemp_transCaption := Form
				extent: 34 @ 9
				depth: 1
				fromArray: #(0 0 256 0 256 0 3808663859 2147483648 2491688266 2147483648 2491688266 0 2491688266 0 2466486578 0 0 0 )
				offset: 0 @ 0.
	"(DisplayText text: 'no color' asText textStyle: (TextConstants at:
	#ComicPlain)) form storeString"
	_gsSqueakTemp_transHt := _gsSqueakTemp_transCaption height.
	_gsSqueakTemp_palette
		fillWhite: (0 @ 0 extent: _gsSqueakTemp_palette width @ _gsSqueakTemp_transHt).
	_gsSqueakTemp_palette
		fillBlack: (0 @ _gsSqueakTemp_transHt extent: _gsSqueakTemp_palette width @ 1).
	_gsSqueakTemp_transCaption displayOn: _gsSqueakTemp_palette at: _gsSqueakTemp_palette boundingBox topCenter - (_gsSqueakTemp_transCaption width // 2 @ 0).
	_gsSqueakTemp_grayWidth := 10.
	_gsSqueakTemp_startHue := 338.0.
	_gsSqueakTemp_vSteps := _gsSqueakTemp_palette height - _gsSqueakTemp_transHt // 2.
	_gsSqueakTemp_hSteps := _gsSqueakTemp_palette width - _gsSqueakTemp_grayWidth.
	_gsSqueakTemp_x := 0.
	_gsSqueakTemp_startHue
		to: _gsSqueakTemp_startHue + 360.0
		by: 360.0 / _gsSqueakTemp_hSteps
		do: [:h | 
			| basicHue |
			basicHue := Color
						h: h asFloat
						s: 1.0
						v: 1.0.
			_gsSqueakTemp_y := _gsSqueakTemp_transHt + 1.
			0
				to: _gsSqueakTemp_vSteps
				do: [:n | 
					_gsSqueakTemp_c := basicHue mixed: n asFloat / _gsSqueakTemp_vSteps asFloat with: Color white.
					_gsSqueakTemp_c := colorMapper value: _gsSqueakTemp_c.
					_gsSqueakTemp_palette
						fill: (_gsSqueakTemp_x @ _gsSqueakTemp_y extent: 1 @ 1)
						fillColor: _gsSqueakTemp_c.
					_gsSqueakTemp_y := _gsSqueakTemp_y + 1].
			1
				to: _gsSqueakTemp_vSteps
				do: [:n | 
					_gsSqueakTemp_c := Color black mixed: n asFloat / _gsSqueakTemp_vSteps asFloat with: basicHue.
					_gsSqueakTemp_c := colorMapper value: _gsSqueakTemp_c.
					_gsSqueakTemp_palette
						fill: (_gsSqueakTemp_x @ _gsSqueakTemp_y extent: 1 @ 1)
						fillColor: _gsSqueakTemp_c.
					_gsSqueakTemp_y := _gsSqueakTemp_y + 1].
			_gsSqueakTemp_x := _gsSqueakTemp_x + 1].
	_gsSqueakTemp_y := _gsSqueakTemp_transHt + 1.
	1
		to: _gsSqueakTemp_vSteps * 2
		do: [:n | 
			_gsSqueakTemp_c := Color black mixed: n asFloat / (_gsSqueakTemp_vSteps * 2) asFloat with: Color white.
			_gsSqueakTemp_c := colorMapper value: _gsSqueakTemp_c.
			_gsSqueakTemp_palette
				fill: (_gsSqueakTemp_x @ _gsSqueakTemp_y extent: 10 @ 1)
				fillColor: _gsSqueakTemp_c.
			_gsSqueakTemp_y := _gsSqueakTemp_y + 1].
	^ _gsSqueakTemp_palette