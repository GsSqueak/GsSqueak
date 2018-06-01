actions & preps
pickupMouseUp: evt 
	"Grab a part of the picture (or screen) and store it in a known place.
	Like Copy on the Mac menu. Then switch to the stamp tool."
	| _gsSqueakTemp_rr _gsSqueakTemp_pForm _gsSqueakTemp_ii _gsSqueakTemp_oldRect _gsSqueakTemp_sOrigin _gsSqueakTemp_priorEvt |
	_gsSqueakTemp_sOrigin := self get: #strokeOrigin for: evt.
	(_gsSqueakTemp_priorEvt := self get: #lastEvent for: evt) isNil
		ifFalse: ["Last draw will stick out, must erase the area"
			_gsSqueakTemp_oldRect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_priorEvt cursorPoint + (14 @ 14).
			self
				restoreRect: (_gsSqueakTemp_oldRect insetBy: -2)].
	self primaryHand showTemporaryCursor: nil.
	"later get rid of this"
	_gsSqueakTemp_rr := _gsSqueakTemp_sOrigin rect: evt cursorPoint + (14 @ 14).
	_gsSqueakTemp_ii := _gsSqueakTemp_rr translateBy: 0 @ 0 - bounds origin.
	(_gsSqueakTemp_rr intersects: bounds)
		ifTrue: [_gsSqueakTemp_pForm := paintingForm copy: _gsSqueakTemp_ii.
			_gsSqueakTemp_pForm isAllWhite
				ifTrue: [_gsSqueakTemp_pForm := nil
					"Get an un-dimmed picture of other objects on the
					playfield "
					"don't know how yet"]].
	_gsSqueakTemp_pForm
		ifNil: [_gsSqueakTemp_pForm := Form fromDisplay: _gsSqueakTemp_rr].
	"Anywhere on the screen"
	palette pickupForm: _gsSqueakTemp_pForm evt: evt.
	evt hand
		showTemporaryCursor: (self getCursorFor: evt)