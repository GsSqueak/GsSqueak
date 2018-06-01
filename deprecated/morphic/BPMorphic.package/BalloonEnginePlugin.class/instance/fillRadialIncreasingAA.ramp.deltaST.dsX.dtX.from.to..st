fills-gradient
fillRadialIncreasingAA: fill ramp: ramp deltaST: deltaST dsX: dsX dtX: dtX from: leftX to: rightX 
	"Part 2b) Compute the increasing part of the ramp"
	| _gsSqueakTemp_ds _gsSqueakTemp_dt _gsSqueakTemp_rampIndex _gsSqueakTemp_rampValue _gsSqueakTemp_length2 _gsSqueakTemp_x _gsSqueakTemp_nextLength _gsSqueakTemp_rampSize _gsSqueakTemp_lastLength _gsSqueakTemp_aaLevel _gsSqueakTemp_colorMask _gsSqueakTemp_colorShift _gsSqueakTemp_baseShift _gsSqueakTemp_index _gsSqueakTemp_firstPixel _gsSqueakTemp_lastPixel |
	_gsSqueakTemp_ds := (self cCoerce: deltaST to: 'int*')
				at: 0.
	_gsSqueakTemp_dt := (self cCoerce: deltaST to: 'int*')
				at: 1.
	_gsSqueakTemp_aaLevel := self aaLevelGet.
	_gsSqueakTemp_baseShift := self aaShiftGet.
	_gsSqueakTemp_rampIndex := self accurateLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
	_gsSqueakTemp_rampSize := self gradientRampLengthOf: fill.
	_gsSqueakTemp_length2 := _gsSqueakTemp_rampSize - 1 * (_gsSqueakTemp_rampSize - 1).
	"This is the upper bound"
	_gsSqueakTemp_nextLength := _gsSqueakTemp_rampIndex + 1 * (_gsSqueakTemp_rampIndex + 1).
	_gsSqueakTemp_lastLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
	_gsSqueakTemp_x := leftX.
	_gsSqueakTemp_firstPixel := self aaFirstPixelFrom: leftX to: rightX.
	_gsSqueakTemp_lastPixel := self aaLastPixelFrom: leftX to: rightX.
	"Deal with the first n subPixels"
	(_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
			and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2])
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet.
			_gsSqueakTemp_colorShift := self aaColorShiftGet.
			_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
				and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2]]
				whileTrue: ["Try to copy the current value more than once"
					[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
						and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
								<= _gsSqueakTemp_nextLength]]
						whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
							spanBuffer at: _gsSqueakTemp_index put: (spanBuffer at: _gsSqueakTemp_index)
									+ _gsSqueakTemp_rampValue.
							_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
							_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX.
							_gsSqueakTemp_dt := _gsSqueakTemp_dt + dtX].
					_gsSqueakTemp_lastLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
					[_gsSqueakTemp_lastLength > _gsSqueakTemp_nextLength]
						whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex + 1.
							_gsSqueakTemp_rampValue := self
										makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
												at: _gsSqueakTemp_rampIndex).
							_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
										>> _gsSqueakTemp_colorShift.
							_gsSqueakTemp_nextLength := _gsSqueakTemp_rampIndex + 1 * (_gsSqueakTemp_rampIndex + 1)]]].
	"Deal with the full pixels"
	(_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
			and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2])
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet >> self aaShiftGet bitOr: 4042322160.
			_gsSqueakTemp_colorShift := self aaShiftGet.
			_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
				and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2]]
				whileTrue: ["Try to copy the current value more than once"
					[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
						and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
								<= _gsSqueakTemp_nextLength]]
						whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
							spanBuffer at: _gsSqueakTemp_index put: (spanBuffer at: _gsSqueakTemp_index)
									+ _gsSqueakTemp_rampValue.
							_gsSqueakTemp_x := _gsSqueakTemp_x + _gsSqueakTemp_aaLevel.
							_gsSqueakTemp_ds := _gsSqueakTemp_ds + (dsX << _gsSqueakTemp_colorShift).
							_gsSqueakTemp_dt := _gsSqueakTemp_dt + (dtX << _gsSqueakTemp_colorShift)].
					_gsSqueakTemp_lastLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
					[_gsSqueakTemp_lastLength > _gsSqueakTemp_nextLength]
						whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex + 1.
							_gsSqueakTemp_rampValue := self
										makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
												at: _gsSqueakTemp_rampIndex).
							_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
										>> _gsSqueakTemp_colorShift.
							_gsSqueakTemp_nextLength := _gsSqueakTemp_rampIndex + 1 * (_gsSqueakTemp_rampIndex + 1)]]].
	"Deal with last n sub-pixels"
	(_gsSqueakTemp_x < rightX
			and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2])
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet.
			_gsSqueakTemp_colorShift := self aaColorShiftGet.
			_gsSqueakTemp_rampValue := self
						makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
								at: _gsSqueakTemp_rampIndex).
			_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
						>> _gsSqueakTemp_colorShift.
			[_gsSqueakTemp_x < rightX
				and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2]]
				whileTrue: ["Try to copy the current value more than once"
					[_gsSqueakTemp_x < rightX
						and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
								<= _gsSqueakTemp_nextLength]]
						whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
							spanBuffer at: _gsSqueakTemp_index put: (spanBuffer at: _gsSqueakTemp_index)
									+ _gsSqueakTemp_rampValue.
							_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
							_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX.
							_gsSqueakTemp_dt := _gsSqueakTemp_dt + dtX].
					_gsSqueakTemp_lastLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
					[_gsSqueakTemp_lastLength > _gsSqueakTemp_nextLength]
						whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex + 1.
							_gsSqueakTemp_rampValue := self
										makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
												at: _gsSqueakTemp_rampIndex).
							_gsSqueakTemp_rampValue := (_gsSqueakTemp_rampValue bitAnd: _gsSqueakTemp_colorMask)
										>> _gsSqueakTemp_colorShift.
							_gsSqueakTemp_nextLength := _gsSqueakTemp_rampIndex + 1 * (_gsSqueakTemp_rampIndex + 1)]]].
	"Done -- store stuff back"
	(self cCoerce: deltaST to: 'int *')
		at: 0
		put: _gsSqueakTemp_ds.
	(self cCoerce: deltaST to: 'int *')
		at: 1
		put: _gsSqueakTemp_dt.
	^ _gsSqueakTemp_x