private
displayAll
	"Read all the glyphs and display them"
	| glyph form scale points x y |
	points := 24.
	scale := points asFloat / unitsPerEm.
	x := y := 0.
	Display deferUpdates: true.
	1 to: numGlyphs do:[:i|
		glyph := self readGlyphAt: i-1.
		form := glyph asFormWithScale: scale
			ascender: ascender
			descender: descender.
		Display fillWhite: (x@y extent: form extent).
		form displayOn: Display at: x@y rule: 34.
		Display forceToScreen: (x@y extent: form extent).
		x := x + form width.
		x > Display width ifTrue:[y := y + form height. x := 0].
		y > Display height ifTrue:[y := 0].
		Sensor anyButtonPressed ifTrue:[^Display restore].
	].