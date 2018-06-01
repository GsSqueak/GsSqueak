actions & preps
ellipse: evt 
	"Draw an ellipse from the center."
	| _gsSqueakTemp_rect _gsSqueakTemp_oldRect _gsSqueakTemp_ww _gsSqueakTemp_ext _gsSqueakTemp_oldExt _gsSqueakTemp_cColor _gsSqueakTemp_sOrigin |
	_gsSqueakTemp_sOrigin := self get: #strokeOrigin for: evt.
	_gsSqueakTemp_cColor := self getColorFor: evt.
	_gsSqueakTemp_ext := (_gsSqueakTemp_sOrigin - evt cursorPoint) abs * 2.
	evt shiftPressed
		ifTrue: [_gsSqueakTemp_ext := self shiftConstrainPoint: _gsSqueakTemp_ext].
	_gsSqueakTemp_rect := Rectangle center: _gsSqueakTemp_sOrigin extent: _gsSqueakTemp_ext.
	_gsSqueakTemp_ww := (self getNibFor: evt) width.
	(self get: #lastEvent for: evt)
		ifNotNil: [:_gsSqueakTemp_priorEvt | 
			_gsSqueakTemp_oldExt := (_gsSqueakTemp_sOrigin - _gsSqueakTemp_priorEvt cursorPoint) abs + _gsSqueakTemp_ww * 2.
			_gsSqueakTemp_priorEvt shiftPressed
				ifTrue: [_gsSqueakTemp_oldExt := self shiftConstrainPoint: _gsSqueakTemp_oldExt].
			_gsSqueakTemp_oldExt < _gsSqueakTemp_ext
				ifFalse: ["Last draw sticks out, must erase the area"
					_gsSqueakTemp_oldRect := Rectangle center: _gsSqueakTemp_sOrigin extent: _gsSqueakTemp_oldExt.
					self restoreRect: _gsSqueakTemp_oldRect]].
	_gsSqueakTemp_cColor == Color transparent
		ifTrue: [formCanvas
				fillOval: _gsSqueakTemp_rect
				color: _gsSqueakTemp_cColor
				borderWidth: _gsSqueakTemp_ww
				borderColor: Color black]
		ifFalse: [formCanvas
				fillOval: _gsSqueakTemp_rect
				color: Color transparent
				borderWidth: _gsSqueakTemp_ww
				borderColor: _gsSqueakTemp_cColor].
	self invalidRect: _gsSqueakTemp_rect