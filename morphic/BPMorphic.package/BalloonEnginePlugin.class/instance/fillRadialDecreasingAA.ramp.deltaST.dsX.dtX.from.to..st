fills-gradient
fillRadialDecreasingAA: fill ramp: ramp deltaST: deltaST dsX: dsX dtX: dtX from: leftX to: rightX 
	"Part 2a) Compute the decreasing part of the ramp"
	| _gsSqueakTemp_ds _gsSqueakTemp_dt _gsSqueakTemp_rampIndex _gsSqueakTemp_rampValue _gsSqueakTemp_length2 _gsSqueakTemp_x _gsSqueakTemp_nextLength _gsSqueakTemp_x1 _gsSqueakTemp_aaLevel _gsSqueakTemp_colorMask _gsSqueakTemp_colorShift _gsSqueakTemp_baseShift _gsSqueakTemp_index _gsSqueakTemp_firstPixel _gsSqueakTemp_lastPixel |
	_gsSqueakTemp_ds := (self cCoerce: deltaST to: 'int*')
				at: 0.
	_gsSqueakTemp_dt := (self cCoerce: deltaST to: 'int*')
				at: 1.
	_gsSqueakTemp_aaLevel := self aaLevelGet.
	_gsSqueakTemp_baseShift := self aaShiftGet.
	_gsSqueakTemp_rampIndex := self accurateLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
	_gsSqueakTemp_length2 := _gsSqueakTemp_rampIndex - 1 * (_gsSqueakTemp_rampIndex - 1).
	_gsSqueakTemp_x := leftX.
	_gsSqueakTemp_x1 := self fillOriginXOf: fill.
	_gsSqueakTemp_x1 > rightX
		ifTrue: [_gsSqueakTemp_x1 := rightX].
	_gsSqueakTemp_firstPixel := self aaFirstPixelFrom: leftX to: _gsSqueakTemp_x1.
	_gsSqueakTemp_lastPixel := self aaLastPixelFrom: leftX to: _gsSqueakTemp_x1.
	"Deal with the first n sub-pixels"
	_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet.
			_gsSqueakTemp_colorShift := self aaColorShiftGet.
			_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel]
				whileTrue: ["Try to copy the current value more than just once"
					[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
						and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
								>= _gsSqueakTemp_length2]]
						whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
							spanBuffer at: _gsSqueakTemp_index put: (spanBuffer at: _gsSqueakTemp_index)
									+ _gsSqueakTemp_rampValue.
							_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
							_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX.
							_gsSqueakTemp_dt := _gsSqueakTemp_dt + dtX].
					"Step to next ramp value"
					_gsSqueakTemp_nextLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
					[_gsSqueakTemp_nextLength < _gsSqueakTemp_length2]
						whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex - 1.
							_gsSqueakTemp_rampValue := self
										makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
												at: _gsSqueakTemp_rampIndex).
							_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
										>> _gsSqueakTemp_colorShift.
							_gsSqueakTemp_length2 := _gsSqueakTemp_rampIndex - 1 * (_gsSqueakTemp_rampIndex - 1)]]].
	"Deal with the full pixels"
	_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet >> self aaShiftGet bitOr: 4042322160.
			_gsSqueakTemp_colorShift := self aaShiftGet.
			_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel]
				whileTrue: ["Try to copy the current value more than just once"
					[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
						and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
								>= _gsSqueakTemp_length2]]
						whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
							spanBuffer at: _gsSqueakTemp_index put: (spanBuffer at: _gsSqueakTemp_index)
									+ _gsSqueakTemp_rampValue.
							_gsSqueakTemp_x := _gsSqueakTemp_x + _gsSqueakTemp_aaLevel.
							_gsSqueakTemp_ds := _gsSqueakTemp_ds + (dsX << _gsSqueakTemp_colorShift).
							_gsSqueakTemp_dt := _gsSqueakTemp_dt + (dtX << _gsSqueakTemp_colorShift)].
					"Step to next ramp value"
					_gsSqueakTemp_nextLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
					[_gsSqueakTemp_nextLength < _gsSqueakTemp_length2]
						whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex - 1.
							_gsSqueakTemp_rampValue := self
										makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
												at: _gsSqueakTemp_rampIndex).
							_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
										>> _gsSqueakTemp_colorShift.
							_gsSqueakTemp_length2 := _gsSqueakTemp_rampIndex - 1 * (_gsSqueakTemp_rampIndex - 1)]]].
	"Deal with the last n sub-pixels"
	_gsSqueakTemp_x < _gsSqueakTemp_x1
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet.
			_gsSqueakTemp_colorShift := self aaColorShiftGet.
			_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			[_gsSqueakTemp_x < _gsSqueakTemp_x1]
				whileTrue: ["Try to copy the current value more than just once"
					[_gsSqueakTemp_x < _gsSqueakTemp_x1
						and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
								>= _gsSqueakTemp_length2]]
						whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
							spanBuffer at: _gsSqueakTemp_index put: (spanBuffer at: _gsSqueakTemp_index)
									+ _gsSqueakTemp_rampValue.
							_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
							_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX.
							_gsSqueakTemp_dt := _gsSqueakTemp_dt + dtX].
					"Step to next ramp value"
					_gsSqueakTemp_nextLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
					[_gsSqueakTemp_nextLength < _gsSqueakTemp_length2]
						whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex - 1.
							_gsSqueakTemp_rampValue := self
										makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
												at: _gsSqueakTemp_rampIndex).
							_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
										>> _gsSqueakTemp_colorShift.
							_gsSqueakTemp_length2 := _gsSqueakTemp_rampIndex - 1 * (_gsSqueakTemp_rampIndex - 1)]]].
	"Done -- store stuff back"
	(self cCoerce: deltaST to: 'int *')
		at: 0
		put: _gsSqueakTemp_ds.
	(self cCoerce: deltaST to: 'int *')
		at: 1
		put: _gsSqueakTemp_dt.
	^ _gsSqueakTemp_x