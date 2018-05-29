layout
basicWidth
	basicWidth ifNil: [basicWidth := owner ifNotNil: [owner width] ifNil: [100]].
	^ basicWidth