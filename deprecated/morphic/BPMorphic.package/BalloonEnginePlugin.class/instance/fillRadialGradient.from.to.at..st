fills-gradient
fillRadialGradient: fill from: leftX to: rightX at: yValue 
	"Draw a radial gradient fill."
	| _gsSqueakTemp_x _gsSqueakTemp_x1 _gsSqueakTemp_ramp _gsSqueakTemp_rampSize _gsSqueakTemp_dsX _gsSqueakTemp_ds _gsSqueakTemp_dtX _gsSqueakTemp_dt _gsSqueakTemp_length2 _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_deltaST |
	_gsSqueakTemp_ramp := self gradientRampOf: fill.
	_gsSqueakTemp_rampSize := self gradientRampLengthOf: fill.
	_gsSqueakTemp_deltaX := leftX
				- (self fillOriginXOf: fill).
	_gsSqueakTemp_deltaY := yValue
				- (self fillOriginYOf: fill).
	_gsSqueakTemp_dsX := self fillDirectionXOf: fill.
	_gsSqueakTemp_dtX := self fillNormalXOf: fill.
	_gsSqueakTemp_ds := _gsSqueakTemp_deltaX * _gsSqueakTemp_dsX + (_gsSqueakTemp_deltaY
					* (self fillDirectionYOf: fill)).
	_gsSqueakTemp_dt := _gsSqueakTemp_deltaX * _gsSqueakTemp_dtX + (_gsSqueakTemp_deltaY
					* (self fillNormalYOf: fill)).
	_gsSqueakTemp_x := leftX.
	_gsSqueakTemp_x1 := rightX.
	"Note: The inner loop has been divided into three parts for speed"
	"Part one: Fill everything outside the left boundary"
	_gsSqueakTemp_length2 := _gsSqueakTemp_rampSize - 1 * (_gsSqueakTemp_rampSize - 1).
	"This is the upper bound"
	[(self squaredLengthOf: _gsSqueakTemp_ds // 65536 with: _gsSqueakTemp_dt // 65536)
			>= _gsSqueakTemp_length2
		and: [_gsSqueakTemp_x < _gsSqueakTemp_x1]]
		whileTrue: [_gsSqueakTemp_x := _gsSqueakTemp_x + 1.
			_gsSqueakTemp_ds := _gsSqueakTemp_ds + _gsSqueakTemp_dsX.
			_gsSqueakTemp_dt := _gsSqueakTemp_dt + _gsSqueakTemp_dtX].
	_gsSqueakTemp_x > leftX
		ifTrue: [self
				fillColorSpan: (self
						makeUnsignedFrom: (_gsSqueakTemp_ramp at: _gsSqueakTemp_rampSize - 1))
				from: leftX
				to: _gsSqueakTemp_x].
	"Part two: Fill everything inside the boundaries"
	_gsSqueakTemp_deltaST := self point1Get.
	_gsSqueakTemp_deltaST at: 0 put: _gsSqueakTemp_ds.
	_gsSqueakTemp_deltaST at: 1 put: _gsSqueakTemp_dt.
	_gsSqueakTemp_x
			< (self fillOriginXOf: fill)
		ifTrue: ["Draw the decreasing part"
			self aaLevelGet = 1
				ifTrue: [_gsSqueakTemp_x := self
								fillRadialDecreasing: fill
								ramp: _gsSqueakTemp_ramp
								deltaST: _gsSqueakTemp_deltaST
								dsX: _gsSqueakTemp_dsX
								dtX: _gsSqueakTemp_dtX
								from: _gsSqueakTemp_x
								to: _gsSqueakTemp_x1]
				ifFalse: [_gsSqueakTemp_x := self
								fillRadialDecreasingAA: fill
								ramp: _gsSqueakTemp_ramp
								deltaST: _gsSqueakTemp_deltaST
								dsX: _gsSqueakTemp_dsX
								dtX: _gsSqueakTemp_dtX
								from: _gsSqueakTemp_x
								to: _gsSqueakTemp_x1]].
	_gsSqueakTemp_x < _gsSqueakTemp_x1
		ifTrue: ["Draw the increasing part"
			self aaLevelGet = 1
				ifTrue: [_gsSqueakTemp_x := self
								fillRadialIncreasing: fill
								ramp: _gsSqueakTemp_ramp
								deltaST: _gsSqueakTemp_deltaST
								dsX: _gsSqueakTemp_dsX
								dtX: _gsSqueakTemp_dtX
								from: _gsSqueakTemp_x
								to: _gsSqueakTemp_x1]
				ifFalse: [_gsSqueakTemp_x := self
								fillRadialIncreasingAA: fill
								ramp: _gsSqueakTemp_ramp
								deltaST: _gsSqueakTemp_deltaST
								dsX: _gsSqueakTemp_dsX
								dtX: _gsSqueakTemp_dtX
								from: _gsSqueakTemp_x
								to: _gsSqueakTemp_x1]].
	"Part three fill everything outside right boundary"
	_gsSqueakTemp_x < rightX
		ifTrue: [self
				fillColorSpan: (self
						makeUnsignedFrom: (_gsSqueakTemp_ramp at: _gsSqueakTemp_rampSize - 1))
				from: _gsSqueakTemp_x
				to: rightX]