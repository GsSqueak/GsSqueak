experimental
subdivideExternalEdge: external from: boundaryObject
	| external2 |
	external2 := external subdivide.
	external2 notNil ifTrue:[
		self subdivideExternalEdge: external from: boundaryObject.
		self subdivideExternalEdge: external2 from: boundaryObject.
	] ifFalse:[
		self registerExternalEdge: external from: boundaryObject.
	].