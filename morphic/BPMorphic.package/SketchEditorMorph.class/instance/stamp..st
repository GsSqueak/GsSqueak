actions & preps
stamp: evt 
	"plop one copy of the user's chosen Form down."
	"Check depths"
	| _gsSqueakTemp_pt _gsSqueakTemp_sForm |
	_gsSqueakTemp_sForm := self get: #stampForm for: evt.
	_gsSqueakTemp_pt := evt cursorPoint - (_gsSqueakTemp_sForm extent // 2).
	_gsSqueakTemp_sForm
		displayOn: paintingForm
		at: _gsSqueakTemp_pt - bounds origin
		clippingBox: paintingForm boundingBox
		rule: Form paint
		fillColor: nil.
	self
		render: (_gsSqueakTemp_pt extent: _gsSqueakTemp_sForm extent)