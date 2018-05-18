helper
font: f hasGlyphOf: aCharacter

	| font |
	font := f isFontSet ifTrue: [f fontArray first] ifFalse: [f].
	^ font isTTCFont
		ifFalse: [font hasGlyphOf: aCharacter]
		ifTrue: [
			" [(f hasGlyphOf: aCharacter) not] does not work, the fallback glyph is always found instead.
			So we fake. if aCharacter is the same form as Character null aka 0, we assume absence."
			(font characterFormAt: aCharacter) bits ~= font fallbackForm bits]
