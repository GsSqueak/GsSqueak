smoothing
slopes: knots 
	"Choose slopes according to state of polygon and preferences"
	self isCurvy
		ifFalse: [^ knots segmentedSlopes].
	^ (closed
			and: [self isCurvier])
		ifTrue: [knots closedCubicSlopes]
		ifFalse: [knots naturalCubicSlopes]