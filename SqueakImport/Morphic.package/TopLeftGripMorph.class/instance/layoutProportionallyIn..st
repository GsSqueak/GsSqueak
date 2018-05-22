layout
layoutProportionallyIn: newBounds
	| b |
	b := owner bounds.
	self bounds: (b topLeft extent: self extent)
