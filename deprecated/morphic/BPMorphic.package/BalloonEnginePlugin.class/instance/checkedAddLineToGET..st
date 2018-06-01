GET processing
checkedAddLineToGET: line 
	"Add the line to the global edge table if it intersects the clipping region"
	| _gsSqueakTemp_lineWidth |
	(self isWide: line)
		ifTrue: [_gsSqueakTemp_lineWidth := self wideLineExtentOf: line]
		ifFalse: [_gsSqueakTemp_lineWidth := 0].
	(self lineEndYOf: line)
			+ _gsSqueakTemp_lineWidth < self fillMinYGet
		ifTrue: [^ 0].
	"Overlaps in Y but may still be entirely right of clip region"
	((self edgeXValueOf: line)
				- _gsSqueakTemp_lineWidth >= self fillMaxXGet
			and: [(self lineEndXOf: line)
					- _gsSqueakTemp_lineWidth >= self fillMaxXGet])
		ifTrue: [^ 0].
	self addEdgeToGET: line