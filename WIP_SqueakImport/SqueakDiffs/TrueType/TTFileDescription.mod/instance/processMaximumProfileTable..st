ttf tables
processMaximumProfileTable: fontFile
"
numGlyphs         USHORT      The number of glyphs in the font.
"
	fontFile skip: 4. "Skip Table version number"
	numGlyphs := fontFile nextNumber: 2.