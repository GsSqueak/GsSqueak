migration
compactForRanges: rangesArray

	| newGlyphTable noMapping |
	noMapping := glyphs == glyphTable.
	newGlyphTable :=  SparseLargeTable new: rangesArray last last chunkSize: 32 arrayClass: Array base: 0 + 1 defaultValue: (glyphs at: 1).
	rangesArray do: [:pair |
		pair first to: pair second do: [:i |
			newGlyphTable at: i put: (glyphs at: i)
		]
	].
	glyphTable := newGlyphTable.
	noMapping ifTrue: [glyphs := glyphTable].
