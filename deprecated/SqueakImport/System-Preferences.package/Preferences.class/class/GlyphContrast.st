standard queries
GlyphContrast
	^ self
		valueOfFlag: #GlyphContrast
		ifAbsent: [50]