experimental
registerBoundary: boundaryObject transformation: aMatrix
	| external |
	external := boundaryObject asEdgeRepresentation: (self fullTransformFrom: aMatrix).
	self subdivideExternalEdge: external from: boundaryObject.
