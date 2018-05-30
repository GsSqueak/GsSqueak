as yet unclassified
resizingEdge: edgeSymbol

	(#(top bottom) includes: edgeSymbol) ifFalse:
		[ self error: 'resizingEdge must be #top or #bottom' ].
	resizingEdge := edgeSymbol.
	self on: #mouseEnter send: #firstEnter: to: self.
