layout
layoutProportionallyIn: newBounds
	| b |
	b := owner bounds.
	
	self bounds: (b right - self width @ b top extent: self extent)
