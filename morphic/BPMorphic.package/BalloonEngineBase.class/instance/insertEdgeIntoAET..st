AET processing
insertEdgeIntoAET: edge 
	"Insert the edge with the given index from the global edge table into
	the active edge table.
	The edge has already been stepped to the initial yValue -- thus
	remainingLines and rasterX
	are both set."
	| _gsSqueakTemp_index |
	"Check for the number of lines remaining"
	(self edgeNumLinesOf: edge)
			<= 0
		ifTrue: [^ nil].
	"Nothing to do"
	"Find insertion point"
	_gsSqueakTemp_index := self indexForInsertingIntoAET: edge.
	"And insert edge"
	self insertToAET: edge beforeIndex: _gsSqueakTemp_index