layout
layoutProportionallyIn: newBounds 
	| _gsSqueakTemp_b |
	_gsSqueakTemp_b := owner bounds.
	self
		bounds: (_gsSqueakTemp_b topLeft extent: self extent)