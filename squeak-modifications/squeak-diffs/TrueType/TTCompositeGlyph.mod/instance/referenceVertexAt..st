initialize
referenceVertexAt: index
	"Only used while reading before constructing contours"
	| i |
	i := index.
	self glyphsAndTransformationsDo: [:glyph :transform | | p |
		p := glyph referenceVertexAt: i.
		p isPoint
			ifTrue: [^transform localPointToGlobal: p].
		i := i - p].
	self error: ['this should not happen']