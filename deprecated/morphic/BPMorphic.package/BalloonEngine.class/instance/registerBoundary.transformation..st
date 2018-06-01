experimental
registerBoundary: boundaryObject transformation: aMatrix 
	| _gsSqueakTemp_external |
	_gsSqueakTemp_external := boundaryObject
				asEdgeRepresentation: (self fullTransformFrom: aMatrix).
	self subdivideExternalEdge: _gsSqueakTemp_external from: boundaryObject