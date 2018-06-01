private
basicHasGlyphOf: aCharacter
	"Answer whether this font includes a glyph for the given character"
	^ aCharacter charCode <= self maxAscii
		and:[
			aCharacter = Character null
				ifTrue: [(self formOf: aCharacter) notNil]
				ifFalse: [
					"this should also be
						 (self formOf: aCharacter) notNil
					but it does not work, the fallback glyph -- if present -- is always found instead.
					So we fake. if aCharacter is the same form as Character null aka 0, we assume absence."
					(self characterFormAt: aCharacter) bits ~= self fallbackForm bits]]