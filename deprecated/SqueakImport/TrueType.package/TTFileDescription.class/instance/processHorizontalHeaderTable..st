ttf tables
processHorizontalHeaderTable: fontFile
"
ascender           SHORT          Typographic ascent.
descender          SHORT          Typographic descent.
lineGap            SHORT          Typographic lineGap.
numberOfHMetrics   USHORT         Number hMetric entries in the HTMX
                                               Table; may be smaller than the total
                                             number of glyphs.
"
	fontFile skip: 4. "Skip table version"
	ascender := self short: (fontFile nextNumber: 2).
	descender := self short: (fontFile nextNumber: 2).
	lineGap := self short: (fontFile nextNumber: 2).
	fontFile skip: 2. "Skip advanceWidthMax"
	fontFile skip: 2. "Skip minLeftSideBearing"
	fontFile skip: 2. "Skip minRightSideBearing"
	fontFile skip: 2. "Skip xMaxExtent"
	fontFile skip: 2. "Skip caretSlopeRise"
	fontFile skip: 2. "Skip caretSlopeRun"
	fontFile skip: 10. "Skip 5 reserved shorts"
	fontFile skip: 2. "Skip metricDataFormat"

	numHMetrics := fontFile nextNumber: 2.

	^numHMetrics