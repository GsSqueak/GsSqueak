rendering
renderGlyph: code height: height fgColor: fgColor bgColor: bgColor depth: depth 
	"Render the glyph with the given code point at the specified pixel
	height. "
	^ (self at: code)
		asFormWithScale: height asFloat / (ascender - descender)
		ascender: ascender
		descender: descender
		fgColor: fgColor
		bgColor: bgColor
		depth: depth