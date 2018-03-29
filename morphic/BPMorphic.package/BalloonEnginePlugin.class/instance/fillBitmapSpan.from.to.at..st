fills-bitmaps
fillBitmapSpan: bmFill from: leftX to: rightX at: yValue 
	| _gsSqueakTemp_x _gsSqueakTemp_x1 _gsSqueakTemp_dsX _gsSqueakTemp_ds _gsSqueakTemp_dtX _gsSqueakTemp_dt _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_bits _gsSqueakTemp_xp _gsSqueakTemp_yp _gsSqueakTemp_bmWidth _gsSqueakTemp_bmHeight _gsSqueakTemp_fillValue _gsSqueakTemp_tileFlag |
	self aaLevelGet = 1
		ifFalse: [^ self
				fillBitmapSpanAA: bmFill
				from: leftX
				to: rightX
				at: yValue].
	_gsSqueakTemp_bits := self loadBitsFrom: bmFill.
	_gsSqueakTemp_bits == nil
		ifTrue: [^ nil].
	_gsSqueakTemp_bmWidth := self bitmapWidthOf: bmFill.
	_gsSqueakTemp_bmHeight := self bitmapHeightOf: bmFill.
	_gsSqueakTemp_tileFlag := (self bitmapTileFlagOf: bmFill)
				= 1.
	_gsSqueakTemp_deltaX := leftX
				- (self fillOriginXOf: bmFill).
	_gsSqueakTemp_deltaY := yValue
				- (self fillOriginYOf: bmFill).
	_gsSqueakTemp_dsX := self fillDirectionXOf: bmFill.
	_gsSqueakTemp_dtX := self fillNormalXOf: bmFill.
	_gsSqueakTemp_ds := _gsSqueakTemp_deltaX * _gsSqueakTemp_dsX + (_gsSqueakTemp_deltaY
					* (self fillDirectionYOf: bmFill)).
	_gsSqueakTemp_dt := _gsSqueakTemp_deltaX * _gsSqueakTemp_dtX + (_gsSqueakTemp_deltaY
					* (self fillNormalYOf: bmFill)).
	_gsSqueakTemp_x := leftX.
	_gsSqueakTemp_x1 := rightX.
	[_gsSqueakTemp_x < _gsSqueakTemp_x1]
		whileTrue: [_gsSqueakTemp_tileFlag
				ifTrue: [_gsSqueakTemp_ds := self repeatValue: _gsSqueakTemp_ds max: _gsSqueakTemp_bmWidth << 16.
					_gsSqueakTemp_dt := self repeatValue: _gsSqueakTemp_dt max: _gsSqueakTemp_bmHeight << 16].
			_gsSqueakTemp_xp := _gsSqueakTemp_ds // 65536.
			_gsSqueakTemp_yp := _gsSqueakTemp_dt // 65536.
			_gsSqueakTemp_tileFlag
				ifFalse: [_gsSqueakTemp_xp := self clampValue: _gsSqueakTemp_xp max: _gsSqueakTemp_bmWidth.
					_gsSqueakTemp_yp := self clampValue: _gsSqueakTemp_yp max: _gsSqueakTemp_bmHeight].
			(_gsSqueakTemp_xp >= 0
					and: [_gsSqueakTemp_yp >= 0
							and: [_gsSqueakTemp_xp < _gsSqueakTemp_bmWidth
									and: [_gsSqueakTemp_yp < _gsSqueakTemp_bmHeight]]])
				ifTrue: [_gsSqueakTemp_fillValue := self
								bitmapValue: bmFill
								bits: _gsSqueakTemp_bits
								atX: _gsSqueakTemp_xp
								y: _gsSqueakTemp_yp.
					spanBuffer at: _gsSqueakTemp_x put: _gsSqueakTemp_fillValue].
			_gsSqueakTemp_ds := _gsSqueakTemp_ds + _gsSqueakTemp_dsX.
			_gsSqueakTemp_dt := _gsSqueakTemp_dt + _gsSqueakTemp_dtX.
			_gsSqueakTemp_x := _gsSqueakTemp_x + 1]