actions & preps
star: evt 
	"Draw an star from the center."
	| _gsSqueakTemp_poly _gsSqueakTemp_ext _gsSqueakTemp_ww _gsSqueakTemp_rect _gsSqueakTemp_oldExt _gsSqueakTemp_oldRect _gsSqueakTemp_oldR _gsSqueakTemp_verts _gsSqueakTemp_pt _gsSqueakTemp_cColor _gsSqueakTemp_sOrigin |
	_gsSqueakTemp_sOrigin := self get: #strokeOrigin for: evt.
	_gsSqueakTemp_cColor := self getColorFor: evt.
	_gsSqueakTemp_ww := (self getNibFor: evt) width.
	_gsSqueakTemp_ext := (_gsSqueakTemp_pt := _gsSqueakTemp_sOrigin - evt cursorPoint) r + _gsSqueakTemp_ww * 2.
	_gsSqueakTemp_rect := Rectangle center: _gsSqueakTemp_sOrigin extent: _gsSqueakTemp_ext.
	(self get: #lastEvent for: evt)
		ifNotNil: [:_gsSqueakTemp_priorEvt | 
			_gsSqueakTemp_oldExt := (_gsSqueakTemp_sOrigin - _gsSqueakTemp_priorEvt cursorPoint) r + _gsSqueakTemp_ww * 2.
			"Last draw sticks out, must erase the area"
			_gsSqueakTemp_oldRect := Rectangle center: _gsSqueakTemp_sOrigin extent: _gsSqueakTemp_oldExt.
			self restoreRect: _gsSqueakTemp_oldRect].
	_gsSqueakTemp_ext := _gsSqueakTemp_pt r.
	_gsSqueakTemp_oldR := _gsSqueakTemp_ext.
	_gsSqueakTemp_verts := (0 to: 350 by: 36)
				collect: [:angle | (Point r: (_gsSqueakTemp_oldR := _gsSqueakTemp_oldR = _gsSqueakTemp_ext
									ifTrue: [_gsSqueakTemp_ext * 5 // 12]
									ifFalse: [_gsSqueakTemp_ext]) degrees: angle + _gsSqueakTemp_pt degrees)
						+ _gsSqueakTemp_sOrigin].
	_gsSqueakTemp_poly := PolygonMorph new addHandles.
	_gsSqueakTemp_poly
		borderColor: (_gsSqueakTemp_cColor isTransparent
				ifTrue: [Color black]
				ifFalse: [_gsSqueakTemp_cColor]).
	_gsSqueakTemp_poly borderWidth: (self getNibFor: evt) width.
	_gsSqueakTemp_poly fillStyle: Color transparent.
	"can't handle thick brushes"
	self invalidRect: _gsSqueakTemp_rect.
	"self addMorph: poly."
	_gsSqueakTemp_poly privateOwner: self.
	_gsSqueakTemp_poly
		bounds: (_gsSqueakTemp_sOrigin extent: _gsSqueakTemp_ext).
	_gsSqueakTemp_poly setVertices: _gsSqueakTemp_verts.
	_gsSqueakTemp_poly drawOn: formCanvas.
	"poly delete."
	self invalidRect: _gsSqueakTemp_rect