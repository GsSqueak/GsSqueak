GET processing
checkedAddBezierToGET: bezier 
	"Add the bezier to the global edge table if it intersects the clipping
	region "
	| _gsSqueakTemp_lineWidth |
	(self isWide: bezier)
		ifTrue: [_gsSqueakTemp_lineWidth := self wideBezierExtentOf: bezier]
		ifFalse: [_gsSqueakTemp_lineWidth := 0].
	(self bezierEndYOf: bezier)
			+ _gsSqueakTemp_lineWidth < self fillMinYGet
		ifTrue: [^ 0].
	"Overlaps in Y but may still be entirely right of clip region"
	((self edgeXValueOf: bezier)
				- _gsSqueakTemp_lineWidth >= self fillMaxXGet
			and: [(self bezierEndXOf: bezier)
					- _gsSqueakTemp_lineWidth >= self fillMaxXGet])
		ifTrue: [^ 0].
	self addEdgeToGET: bezier