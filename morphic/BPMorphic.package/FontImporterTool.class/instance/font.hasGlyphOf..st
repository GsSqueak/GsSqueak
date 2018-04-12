helper
font: f hasGlyphOf: aCharacter 
	| _gsSqueakTemp_font |
	_gsSqueakTemp_font := f isFontSet
				ifTrue: [f fontArray first]
				ifFalse: [f].
	^ _gsSqueakTemp_font isTTCFont
		ifTrue: ["[(f hasGlyphOf: aCharacter) not] does not work, the fallback
			glyph is always found instead.
			So we fake. if aCharacter is the same form as Character null
			aka 0, we assume absence."
			(_gsSqueakTemp_font characterFormAt: aCharacter) bits ~= _gsSqueakTemp_font fallbackForm bits]
		ifFalse: [_gsSqueakTemp_font hasGlyphOf: aCharacter]