actions & preps
line: evt 
	"Draw a line on the paintingForm using formCanvas aimed at it."
	| _gsSqueakTemp_rect _gsSqueakTemp_oldRect _gsSqueakTemp_ww _gsSqueakTemp_now _gsSqueakTemp_diff _gsSqueakTemp_cor _gsSqueakTemp_cColor _gsSqueakTemp_sOrigin |
	_gsSqueakTemp_sOrigin := self get: #strokeOrigin for: evt.
	_gsSqueakTemp_rect := _gsSqueakTemp_sOrigin rect: (_gsSqueakTemp_now := evt cursorPoint).
	evt shiftPressed
		ifTrue: [_gsSqueakTemp_diff := evt cursorPoint - _gsSqueakTemp_sOrigin.
			_gsSqueakTemp_now := _gsSqueakTemp_sOrigin
						+ (Point r: _gsSqueakTemp_diff r degrees: _gsSqueakTemp_diff degrees + 22.5 // 45 * 45).
			_gsSqueakTemp_rect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_now].
	_gsSqueakTemp_ww := (self getNibFor: evt) width.
	(self get: #lastEvent for: evt)
		ifNotNil: [:_gsSqueakTemp_priorEvt | 
			_gsSqueakTemp_oldRect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_priorEvt cursorPoint.
			_gsSqueakTemp_priorEvt shiftPressed
				ifTrue: [_gsSqueakTemp_diff := _gsSqueakTemp_priorEvt cursorPoint - _gsSqueakTemp_sOrigin.
					_gsSqueakTemp_cor := _gsSqueakTemp_sOrigin
								+ (Point r: _gsSqueakTemp_diff r degrees: _gsSqueakTemp_diff degrees + 22.5 // 45 * 45).
					_gsSqueakTemp_oldRect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_cor].
			_gsSqueakTemp_oldRect := _gsSqueakTemp_oldRect expandBy: _gsSqueakTemp_ww @ _gsSqueakTemp_ww.
			"Last draw will always stick out, must erase the area"
			self restoreRect: _gsSqueakTemp_oldRect].
	_gsSqueakTemp_cColor := self getColorFor: evt.
	formCanvas
		line: _gsSqueakTemp_sOrigin
		to: _gsSqueakTemp_now
		width: _gsSqueakTemp_ww
		color: _gsSqueakTemp_cColor.
	self invalidRect: _gsSqueakTemp_rect