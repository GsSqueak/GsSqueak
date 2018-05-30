initialization
handle
	| handle |
	handle := PolygonMorph
				vertices: (Array
						with: 0 @ 0
						with: 16 @ 0
						with: 8 @ 16)
				color: Color white darker
				borderWidth: 1
				borderColor: Color black.
	^ handle
		addMorph: ((RectangleMorph
				newBounds: (8 @ 18 extent: 1 @ (gradientDisplay height - 2))
				color: Color orange)
				borderWidth: 0)