layout
layoutProportionallyIn: newBounds 
	| _gsSqueakTemp_b |
	_gsSqueakTemp_b := owner bounds.
	self
		bounds: (_gsSqueakTemp_b right - self width @ _gsSqueakTemp_b top extent: self extent)