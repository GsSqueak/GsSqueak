fills-gradient
fillLinearGradientAA: fill ramp: ramp ds: deltaS dsX: dsX from: leftX to: rightX 
	"This is the AA version of linear gradient filling."
	| _gsSqueakTemp_colorMask _gsSqueakTemp_colorShift _gsSqueakTemp_baseShift _gsSqueakTemp_rampIndex _gsSqueakTemp_ds _gsSqueakTemp_rampSize _gsSqueakTemp_x _gsSqueakTemp_idx _gsSqueakTemp_rampValue _gsSqueakTemp_aaLevel _gsSqueakTemp_firstPixel _gsSqueakTemp_lastPixel |
	_gsSqueakTemp_aaLevel := self aaLevelGet.
	_gsSqueakTemp_baseShift := self aaShiftGet.
	_gsSqueakTemp_rampSize := self gradientRampLengthOf: fill.
	_gsSqueakTemp_ds := deltaS.
	_gsSqueakTemp_x := leftX.
	_gsSqueakTemp_rampIndex := _gsSqueakTemp_ds // 65536.
	_gsSqueakTemp_firstPixel := self aaFirstPixelFrom: leftX to: rightX.
	_gsSqueakTemp_lastPixel := self aaLastPixelFrom: leftX to: rightX.
	"Deal with the first n sub-pixels"
	_gsSqueakTemp_colorMask := self aaColorMaskGet.
	_gsSqueakTemp_colorShift := self aaColorShiftGet.
	[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
		and: [_gsSqueakTemp_rampIndex < _gsSqueakTemp_rampSize
				and: [_gsSqueakTemp_rampIndex >= 0]]]
		whileTrue: [_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			"Copy as many pixels as possible"
			[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
				and: [_gsSqueakTemp_ds // 65536 = _gsSqueakTemp_rampIndex]]
				whileTrue: [_gsSqueakTemp_idx := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
					spanBuffer at: _gsSqueakTemp_idx put: (spanBuffer at: _gsSqueakTemp_idx)
							+ _gsSqueakTemp_rampValue.
					_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
					_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX].
			_gsSqueakTemp_rampIndex := _gsSqueakTemp_ds // 65536].
	"Deal with the full pixels"
	_gsSqueakTemp_colorMask := self aaColorMaskGet >> self aaShiftGet bitOr: 4042322160.
	_gsSqueakTemp_colorShift := self aaShiftGet.
	[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
		and: [_gsSqueakTemp_rampIndex < _gsSqueakTemp_rampSize
				and: [_gsSqueakTemp_rampIndex >= 0]]]
		whileTrue: [_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			"Copy as many pixels as possible"
			[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
				and: [_gsSqueakTemp_ds // 65536 = _gsSqueakTemp_rampIndex]]
				whileTrue: [_gsSqueakTemp_idx := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
					spanBuffer at: _gsSqueakTemp_idx put: (spanBuffer at: _gsSqueakTemp_idx)
							+ _gsSqueakTemp_rampValue.
					_gsSqueakTemp_x := _gsSqueakTemp_x + _gsSqueakTemp_aaLevel.
					_gsSqueakTemp_ds := _gsSqueakTemp_ds + (dsX << _gsSqueakTemp_colorShift)].
			_gsSqueakTemp_rampIndex := _gsSqueakTemp_ds // 65536].
	"Deal with the last n sub-pixels"
	_gsSqueakTemp_colorMask := self aaColorMaskGet.
	_gsSqueakTemp_colorShift := self aaColorShiftGet.
	[_gsSqueakTemp_x < rightX
		and: [_gsSqueakTemp_rampIndex < _gsSqueakTemp_rampSize
				and: [_gsSqueakTemp_rampIndex >= 0]]]
		whileTrue: [_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			"Copy as many pixels as possible"
			[_gsSqueakTemp_x < rightX
				and: [_gsSqueakTemp_ds // 65536 = _gsSqueakTemp_rampIndex]]
				whileTrue: [_gsSqueakTemp_idx := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
					spanBuffer at: _gsSqueakTemp_idx put: (spanBuffer at: _gsSqueakTemp_idx)
							+ _gsSqueakTemp_rampValue.
					_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
					_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX].
			_gsSqueakTemp_rampIndex := _gsSqueakTemp_ds // 65536].
	^ _gsSqueakTemp_x