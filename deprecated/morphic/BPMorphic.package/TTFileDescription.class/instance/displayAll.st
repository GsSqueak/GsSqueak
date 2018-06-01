private
displayAll
	"Read all the glyphs and display them"
	| _gsSqueakTemp_glyph _gsSqueakTemp_form _gsSqueakTemp_scale _gsSqueakTemp_points _gsSqueakTemp_x _gsSqueakTemp_y |
	_gsSqueakTemp_points := 24.
	_gsSqueakTemp_scale := _gsSqueakTemp_points asFloat / unitsPerEm.
	_gsSqueakTemp_x := _gsSqueakTemp_y := 0.
	Display deferUpdates: true.
	1
		to: numGlyphs
		do: [:i | 
			_gsSqueakTemp_glyph := self readGlyphAt: i - 1.
			_gsSqueakTemp_form := _gsSqueakTemp_glyph
						asFormWithScale: _gsSqueakTemp_scale
						ascender: ascender
						descender: descender.
			Display
				fillWhite: (_gsSqueakTemp_x @ _gsSqueakTemp_y extent: _gsSqueakTemp_form extent).
			_gsSqueakTemp_form
				displayOn: Display
				at: _gsSqueakTemp_x @ _gsSqueakTemp_y
				rule: 34.
			Display
				forceToScreen: (_gsSqueakTemp_x @ _gsSqueakTemp_y extent: _gsSqueakTemp_form extent).
			_gsSqueakTemp_x := _gsSqueakTemp_x + _gsSqueakTemp_form width.
			_gsSqueakTemp_x > Display width
				ifTrue: [_gsSqueakTemp_y := _gsSqueakTemp_y + _gsSqueakTemp_form height.
					_gsSqueakTemp_x := 0].
			_gsSqueakTemp_y > Display height
				ifTrue: [_gsSqueakTemp_y := 0].
			Sensor anyButtonPressed
				ifTrue: [^ Display restore]]