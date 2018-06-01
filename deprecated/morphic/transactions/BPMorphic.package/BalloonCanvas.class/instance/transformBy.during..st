transforming
transformBy: aDisplayTransform during: aBlock 
	| _gsSqueakTemp_myTransform _gsSqueakTemp_result |
	_gsSqueakTemp_myTransform := transform.
	self transformBy: aDisplayTransform.
	_gsSqueakTemp_result := aBlock value: self.
	transform := _gsSqueakTemp_myTransform.
	^ _gsSqueakTemp_result