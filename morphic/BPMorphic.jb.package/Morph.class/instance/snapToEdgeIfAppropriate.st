menus
snapToEdgeIfAppropriate
	| oldBounds |
	(self valueOfProperty: #edgeToAdhereTo)
		ifNotNil: [:edgeSymbol | 
			oldBounds := bounds.
			self adhereToEdge: edgeSymbol.
			bounds ~= oldBounds
				ifTrue: [self world
						ifNotNil: [:aWorld | aWorld viewBox
								ifNotNil: [aWorld displayWorld]]]]