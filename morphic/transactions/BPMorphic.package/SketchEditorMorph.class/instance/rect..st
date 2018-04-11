actions & preps
rect: evt 
	"While moving corner, just write on the canvas. When done, write on
	the paintingForm"
	| _gsSqueakTemp_rect _gsSqueakTemp_oldRect _gsSqueakTemp_now _gsSqueakTemp_diff _gsSqueakTemp_cor _gsSqueakTemp_cColor _gsSqueakTemp_sOrigin _gsSqueakTemp_priorEvt |
	_gsSqueakTemp_sOrigin := self get: #strokeOrigin for: evt.
	_gsSqueakTemp_rect := _gsSqueakTemp_sOrigin rect: (_gsSqueakTemp_now := evt cursorPoint).
	_gsSqueakTemp_cColor := self getColorFor: evt.
	evt shiftPressed
		ifTrue: [_gsSqueakTemp_diff := evt cursorPoint - _gsSqueakTemp_sOrigin.
			_gsSqueakTemp_now := _gsSqueakTemp_sOrigin
						+ (Point r: (_gsSqueakTemp_diff x abs min: _gsSqueakTemp_diff y abs)
									* 2 degrees: _gsSqueakTemp_diff degrees // 90 * 90 + 45).
			_gsSqueakTemp_rect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_now].
	(_gsSqueakTemp_priorEvt := self get: #lastEvent for: evt) isNil
		ifFalse: [_gsSqueakTemp_oldRect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_priorEvt cursorPoint.
			_gsSqueakTemp_priorEvt shiftPressed
				ifTrue: [_gsSqueakTemp_diff := _gsSqueakTemp_priorEvt cursorPoint - _gsSqueakTemp_sOrigin.
					_gsSqueakTemp_cor := _gsSqueakTemp_sOrigin
								+ (Point r: (_gsSqueakTemp_diff x abs min: _gsSqueakTemp_diff y abs)
											* 2 degrees: _gsSqueakTemp_diff degrees // 90 * 90 + 45).
					_gsSqueakTemp_oldRect := _gsSqueakTemp_sOrigin rect: _gsSqueakTemp_cor].
			self restoreRect: _gsSqueakTemp_oldRect].
	"Last draw will stick out, must erase the area"
	_gsSqueakTemp_cColor == Color transparent
		ifTrue: [formCanvas
				frameAndFillRectangle: _gsSqueakTemp_rect
				fillColor: Color transparent
				borderWidth: (self getNibFor: evt) width
				borderColor: Color black]
		ifFalse: [formCanvas
				frameAndFillRectangle: _gsSqueakTemp_rect
				fillColor: Color transparent
				borderWidth: (self getNibFor: evt) width
				borderColor: _gsSqueakTemp_cColor].
	self invalidRect: _gsSqueakTemp_rect