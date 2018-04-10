accessing
fitContents
	| _gsSqueakTemp_newBounds _gsSqueakTemp_boundsChanged |
	_gsSqueakTemp_newBounds := self measureContents.
	_gsSqueakTemp_boundsChanged := bounds extent ~= _gsSqueakTemp_newBounds.
	self extent: _gsSqueakTemp_newBounds.
	"default short-circuits if bounds not changed"
	_gsSqueakTemp_boundsChanged
		ifFalse: [self changed]