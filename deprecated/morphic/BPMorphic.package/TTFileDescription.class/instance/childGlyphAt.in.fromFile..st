glyphs
childGlyphAt: glyphIndex in: glyphCache fromFile: fontFile 
	"Get the glyph with the given glyph index. Look in cache first, then
	read from file.
	Ensure file is positioned at point where it was when it came here."
	^ glyphCache
		at: glyphIndex
		ifAbsentPut: [| glyph filePos |
			filePos := fontFile position.
			glyph := self readGlyphAt: glyphIndex fromFile: fontFile.
			fontFile position: filePos.
			glyph]