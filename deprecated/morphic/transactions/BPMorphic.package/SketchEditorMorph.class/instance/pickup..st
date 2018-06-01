actions & preps
pickup: evt 
	"Grab a part of the picture (or screen) and store it in a known place.
	Note where we started. Use a rubberband rectangle to show what is
	being selected."
	| _gsSqueakTemp_rect _gsSqueakTemp_oldRect _gsSqueakTemp_sOrigin _gsSqueakTemp_priorEvt |
	_gsSqueakTemp_sOrigin := self get: #strokeOrigin for: evt.
	_gsSqueakTemp_rect := _gsSqueakTemp_sOrigin rect: evt cursorPoint + (14 @ 14).
	(_gsSqueakTemp_priorEvt := self get: #lastEvent for: evt) isNil
		ifFalse: ["Last draw will stick out, must erase the area"
			_gsSqueakTemp_oldRect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_priorEvt cursorPoint + (14 @ 14).
			self
				restoreRect: (_gsSqueakTemp_oldRect insetBy: -2)].
	formCanvas
		frameAndFillRectangle: (_gsSqueakTemp_rect insetBy: -2)
		fillColor: Color transparent
		borderWidth: 2
		borderColor: Color gray.
	self
		invalidRect: (_gsSqueakTemp_rect insetBy: -2)