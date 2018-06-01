layout
minWidth
	| _gsSqueakTemp_subMenuWidth _gsSqueakTemp_iconWidth _gsSqueakTemp_markerWidth |
	_gsSqueakTemp_subMenuWidth := self hasSubMenu
				ifTrue: [10]
				ifFalse: [0].
	_gsSqueakTemp_iconWidth := self hasIcon
				ifTrue: [self icon width + 2]
				ifFalse: [0].
	_gsSqueakTemp_markerWidth := self hasMarker
				ifTrue: [self submorphBounds width + 8]
				ifFalse: [0].
	^ (self fontToUse widthOfString: contents)
		+ _gsSqueakTemp_subMenuWidth + _gsSqueakTemp_iconWidth + _gsSqueakTemp_markerWidth + self stringMargin