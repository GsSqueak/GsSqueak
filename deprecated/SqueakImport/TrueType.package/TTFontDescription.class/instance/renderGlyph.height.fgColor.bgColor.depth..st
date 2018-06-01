rendering
renderGlyph: code height: fontHeight fgColor: fgColor bgColor: bgColor depth: depth
	"Render the glyph with the given code point at the specified pixel height."
	^(self at: code) 
		asFormWithScale: fontHeight asFloat / (ascender - descender) 
			ascender: ascender 
			descender: descender 
			fgColor: fgColor bgColor: bgColor depth: depth