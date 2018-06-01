boundaries
minimumWidthOf: aCollection 
	"Answer the minimum width needed to display any of the morphs in
	aCollection. See ProportionalLayout >> #minExtentOf:in:."
	^ aCollection
		inject: 0
		into: [:width :morph | 
			| minWidth |
			minWidth := morph minWidth.
			"morph layoutFrame ifNotNil: [:frame |
			minWidth := frame minWidthFrom: minWidth]."
			minWidth + self width max: width]