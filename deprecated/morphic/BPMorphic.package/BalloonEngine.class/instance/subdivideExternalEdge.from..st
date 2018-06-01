experimental
subdivideExternalEdge: external from: boundaryObject 
	| _gsSqueakTemp_external2 |
	_gsSqueakTemp_external2 := external subdivide.
	_gsSqueakTemp_external2 notNil
		ifTrue: [self subdivideExternalEdge: external from: boundaryObject.
			self subdivideExternalEdge: _gsSqueakTemp_external2 from: boundaryObject]
		ifFalse: [self registerExternalEdge: external from: boundaryObject]