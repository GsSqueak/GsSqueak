menu
applyThickness: newThickness 
	| _gsSqueakTemp_toUse |
	_gsSqueakTemp_toUse := newThickness asNumber max: 0.
	self orientation == #vertical
		ifTrue: [referent width: _gsSqueakTemp_toUse]
		ifFalse: [referent height: _gsSqueakTemp_toUse].
	self positionReferent.
	self adjustPositionVisAVisFlap