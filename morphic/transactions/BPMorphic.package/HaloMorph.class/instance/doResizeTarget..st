dragging or resizing
doResizeTarget: evt 
	| _gsSqueakTemp_oldExtent _gsSqueakTemp_newExtent _gsSqueakTemp_newPosition |
	_gsSqueakTemp_newExtent := originalExtent + (evt position - positionOffset * 2).
	(_gsSqueakTemp_newExtent x > 1
			and: [_gsSqueakTemp_newExtent y > 1])
		ifTrue: [_gsSqueakTemp_oldExtent := target extent.
			target
				setExtentFromHalo: (_gsSqueakTemp_newExtent min: owner extent).
			_gsSqueakTemp_newPosition := target position - (target extent - _gsSqueakTemp_oldExtent // 2).
			_gsSqueakTemp_newPosition := (_gsSqueakTemp_newPosition x min: owner extent x - _gsSqueakTemp_newExtent x max: 0)
						@ (_gsSqueakTemp_newPosition y min: owner extent y - _gsSqueakTemp_newExtent y max: 0).
			target setConstrainedPosition: _gsSqueakTemp_newPosition hangOut: true].
	self bounds: self target worldBoundsForHalo