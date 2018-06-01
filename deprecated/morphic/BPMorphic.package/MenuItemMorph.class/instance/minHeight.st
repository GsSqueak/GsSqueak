layout
minHeight
	| _gsSqueakTemp_iconHeight |
	_gsSqueakTemp_iconHeight := self hasIcon
				ifTrue: [self icon height + 2]
				ifFalse: [0].
	^ self fontToUse height + 2 max: _gsSqueakTemp_iconHeight