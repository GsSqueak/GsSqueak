accessing
fitContents
	| _gsSqueakTemp_newExtent _gsSqueakTemp_f |
	_gsSqueakTemp_f := self fontToUse.
	_gsSqueakTemp_newExtent := (((_gsSqueakTemp_f widthOfString: contents)
				max: self minimumWidth)
				min: self maximumWidth)
				@ _gsSqueakTemp_f height.
	self extent = _gsSqueakTemp_newExtent
		ifFalse: [self extent: _gsSqueakTemp_newExtent.
			self changed]