transforming
preserveStateDuring: aBlock 
	| _gsSqueakTemp_state _gsSqueakTemp_result |
	_gsSqueakTemp_state := BalloonState new.
	_gsSqueakTemp_state transform: transform.
	_gsSqueakTemp_state colorTransform: colorTransform.
	_gsSqueakTemp_state aaLevel: self aaLevel.
	_gsSqueakTemp_result := aBlock value: self.
	transform := _gsSqueakTemp_state transform.
	colorTransform := _gsSqueakTemp_state colorTransform.
	self aaLevel: _gsSqueakTemp_state aaLevel.
	^ _gsSqueakTemp_result