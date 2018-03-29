fills-gradient
fillLinearGradient: fill from: leftX to: rightX at: yValue 
	"Draw a linear gradient fill."
	| _gsSqueakTemp_x0 _gsSqueakTemp_x1 _gsSqueakTemp_ramp _gsSqueakTemp_rampSize _gsSqueakTemp_dsX _gsSqueakTemp_ds _gsSqueakTemp_x _gsSqueakTemp_rampIndex |
	_gsSqueakTemp_ramp := self gradientRampOf: fill.
	_gsSqueakTemp_rampSize := self gradientRampLengthOf: fill.
	_gsSqueakTemp_dsX := self fillDirectionXOf: fill.
	_gsSqueakTemp_ds := leftX
				- (self fillOriginXOf: fill) * _gsSqueakTemp_dsX + (yValue
					- (self fillOriginYOf: fill)
					* (self fillDirectionYOf: fill)).
	_gsSqueakTemp_x := _gsSqueakTemp_x0 := leftX.
	_gsSqueakTemp_x1 := rightX.
	"Note: The inner loop has been divided into three parts for speed"
	"Part one: Fill everything outside the left boundary"
	[((_gsSqueakTemp_rampIndex := _gsSqueakTemp_ds // 65536) < 0
			or: [_gsSqueakTemp_rampIndex >= _gsSqueakTemp_rampSize])
		and: [_gsSqueakTemp_x < _gsSqueakTemp_x1]]
		whileTrue: [_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
			_gsSqueakTemp_ds := _gsSqueakTemp_ds + _gsSqueakTemp_dsX].
	_gsSqueakTemp_x > _gsSqueakTemp_x0
		ifTrue: [_gsSqueakTemp_rampIndex < 0
				ifTrue: [_gsSqueakTemp_rampIndex := 0].
			_gsSqueakTemp_rampIndex >= _gsSqueakTemp_rampSize
				ifTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampSize - 1].
			self
				fillColorSpan: (self
						makeUnsignedFrom: (_gsSqueakTemp_ramp at: _gsSqueakTemp_rampIndex))
				from: _gsSqueakTemp_x0
				to: _gsSqueakTemp_x].
	"Part two: Fill everything inside the boundaries"
	self aaLevelGet = 1
		ifTrue: ["Fast version w/o anti-aliasing"
			[((_gsSqueakTemp_rampIndex := _gsSqueakTemp_ds // 65536) < _gsSqueakTemp_rampSize
					and: [_gsSqueakTemp_rampIndex >= 0])
				and: [_gsSqueakTemp_x < _gsSqueakTemp_x1]]
				whileTrue: [spanBuffer
						at: _gsSqueakTemp_x
						put: (self
								makeUnsignedFrom: (_gsSqueakTemp_ramp at: _gsSqueakTemp_rampIndex)).
					_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
					_gsSqueakTemp_ds := _gsSqueakTemp_ds + _gsSqueakTemp_dsX]]
		ifFalse: [_gsSqueakTemp_x := self
						fillLinearGradientAA: fill
						ramp: _gsSqueakTemp_ramp
						ds: _gsSqueakTemp_ds
						dsX: _gsSqueakTemp_dsX
						from: _gsSqueakTemp_x
						to: rightX].
	"Part three fill everything outside right boundary"
	_gsSqueakTemp_x < _gsSqueakTemp_x1
		ifTrue: [_gsSqueakTemp_rampIndex < 0
				ifTrue: [_gsSqueakTemp_rampIndex := 0].
			_gsSqueakTemp_rampIndex >= _gsSqueakTemp_rampSize
				ifTrue: [_gsSqueakTemp_rampIndex := _gsSqueakTemp_rampSize - 1].
			self
				fillColorSpan: (self
						makeUnsignedFrom: (_gsSqueakTemp_ramp at: _gsSqueakTemp_rampIndex))
				from: _gsSqueakTemp_x
				to: _gsSqueakTemp_x1]