accessing
fitContents
	| _gsSqueakTemp_newExtent |
	_gsSqueakTemp_newExtent := self measureContents.
	_gsSqueakTemp_newExtent := ((_gsSqueakTemp_newExtent x max: self minimumWidth)
				min: self maximumWidth)
				@ _gsSqueakTemp_newExtent y.
	self extent = _gsSqueakTemp_newExtent
		ifFalse: [self extent: _gsSqueakTemp_newExtent.
			self changed]