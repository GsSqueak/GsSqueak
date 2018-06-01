boundaries
minimumHeightOf: aCollection 
	"Answer the minimum height needed to display any of the morphs in
	aCollection. See ProportionalLayout >> #minExtentOf:in:."
	^ aCollection
		inject: 0
		into: [:height :morph | 
			| minHeight |
			minHeight := morph minHeight.
			"morph layoutFrame ifNotNil: [:frame |
			minHeight := frame minHeightFrom: minHeight]."
			minHeight + self height max: height]