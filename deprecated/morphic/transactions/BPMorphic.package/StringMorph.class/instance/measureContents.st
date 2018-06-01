accessing
measureContents
	| _gsSqueakTemp_f |
	_gsSqueakTemp_f := self fontToUse.
	^ ((_gsSqueakTemp_f widthOfString: contents)
		max: self minimumWidth)
		@ _gsSqueakTemp_f height