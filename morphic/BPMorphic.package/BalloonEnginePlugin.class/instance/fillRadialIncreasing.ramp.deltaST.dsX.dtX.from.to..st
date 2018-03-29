fills-gradient
fillRadialIncreasing: fill ramp: ramp deltaST: deltaST dsX: dsX dtX: dtX from: leftX to: rightX 
	"Part 2b) Compute the increasing part of the ramp"
	| _gsSqueakTemp_ds _gsSqueakTemp_dt _gsSqueakTemp_rampIndex _gsSqueakTemp_rampValue _gsSqueakTemp_length2 _gsSqueakTemp_x _gsSqueakTemp_x1 _gsSqueakTemp_nextLength _gsSqueakTemp_rampSize _gsSqueakTemp_lastLength |
	_gsSqueakTemp_ds := (self cCoerce: deltaST to: 'int*')
				at: 0.
	_gsSqueakTemp_dt := (self cCoerce: deltaST to: 'int*')
				at: 1.
	_gsSqueakTemp_rampIndex := self accurateLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
	_gsSqueakTemp_rampValue := self
				makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
						at: _gsSqueakTemp_rampIndex).
	_gsSqueakTemp_rampSize := self gradientRampLengthOf: fill.
	_gsSqueakTemp_length2 := _gsSqueakTemp_rampSize - 1 * (_gsSqueakTemp_rampSize - 1).
	"This is the upper bound"
	_gsSqueakTemp_nextLength := _gsSqueakTemp_rampIndex + 1 * (_gsSqueakTemp_rampIndex + 1).
	_gsSqueakTemp_lastLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
	_gsSqueakTemp_x := leftX.
	_gsSqueakTemp_x1 := rightX.
	[_gsSqueakTemp_x < _gsSqueakTemp_x1
		and: [_gsSqueakTemp_lastLength < _gsSqueakTemp_length2]]
		whileTrue: ["Try to copy the current value more than once"
			[_gsSqueakTemp_x < _gsSqueakTemp_x1
				and: [(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
						<= _gsSqueakTemp_nextLength]]
				whileTrue: [spanBuffer at: _gsSqueakTemp_x put: _gsSqueakTemp_rampValue.
					_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
					_gsSqueakTemp_ds := _gsSqueakTemp_ds + dsX.
					_gsSqueakTemp_dt := _gsSqueakTemp_dt + dtX].
			_gsSqueakTemp_lastLength := self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536.
			[_gsSqueakTemp_lastLength > _gsSqueakTemp_nextLength]
				whileTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampIndex + 1.
					_gsSqueakTemp_rampValue := self
								makeUnsignedFrom: ((self cCoerce: ramp to: 'int *')
										at: _gsSqueakTemp_rampIndex).
					_gsSqueakTemp_nextLength := _gsSqueakTemp_rampIndex + 1 * (_gsSqueakTemp_rampIndex + 1)]].
	(self cCoerce: deltaST to: 'int *')
		at: 0
		put: _gsSqueakTemp_ds.
	(self cCoerce: deltaST to: 'int *')
		at: 1
		put: _gsSqueakTemp_dt.
	^ _gsSqueakTemp_x