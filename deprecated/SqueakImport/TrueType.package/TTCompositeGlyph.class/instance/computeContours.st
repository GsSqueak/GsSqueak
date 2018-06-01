private
computeContours
	| out |
	out := WriteStream on: (Array new: glyphs size * 4).
	self glyphsAndTransformationsDo:[:glyph :transform|
		glyph contours do:[:ptArray|
			out nextPut: (transform localPointsToGlobal: ptArray).
		].
	].
	^out contents