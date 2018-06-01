experimental
registerExternalEdge: externalEdge from: boundaryObject
	externals addLast: externalEdge.
	self primAddExternalEdge: externals size
		initialX: externalEdge initialX
		initialY: externalEdge initialY
		initialZ: externalEdge initialZ
		leftFillIndex: (self registerFill: boundaryObject leftFill transform: nil)
		rightFillIndex: (self registerFill: boundaryObject rightFill transform: nil)