beziers-simple
stepToFirstBezierIn: bezier at: yValue 
	"Initialize the bezier at yValue.
	TODO: Check if reducing maxSteps from 2*deltaY to deltaY 
	brings a *significant* performance improvement.
	In theory this should make for double step performance
	but will cost in quality. Might be that the AA stuff will
	compensate for this - but I'm not really sure."
	| _gsSqueakTemp_updateData _gsSqueakTemp_deltaY _gsSqueakTemp_maxSteps _gsSqueakTemp_scaledStepSize _gsSqueakTemp_squaredStepSize _gsSqueakTemp_startX _gsSqueakTemp_startY _gsSqueakTemp_viaX _gsSqueakTemp_viaY _gsSqueakTemp_endX _gsSqueakTemp_endY _gsSqueakTemp_fwX1 _gsSqueakTemp_fwX2 _gsSqueakTemp_fwY1 _gsSqueakTemp_fwY2 _gsSqueakTemp_fwDx _gsSqueakTemp_fwDDx _gsSqueakTemp_fwDy _gsSqueakTemp_fwDDy |
	"Do a quick check if there is anything at all to do"
	((self isWide: bezier) not
			and: [yValue
					>= (self bezierEndYOf: bezier)])
		ifTrue: [^ self edgeNumLinesOf: bezier put: 0].
	"Now really initialize bezier"
	_gsSqueakTemp_startX := self edgeXValueOf: bezier.
	_gsSqueakTemp_startY := self edgeYValueOf: bezier.
	_gsSqueakTemp_viaX := self bezierViaXOf: bezier.
	_gsSqueakTemp_viaY := self bezierViaYOf: bezier.
	_gsSqueakTemp_endX := self bezierEndXOf: bezier.
	_gsSqueakTemp_endY := self bezierEndYOf: bezier.
	_gsSqueakTemp_deltaY := _gsSqueakTemp_endY - _gsSqueakTemp_startY.
	"Initialize integer forward differencing"
	_gsSqueakTemp_fwX1 := _gsSqueakTemp_viaX - _gsSqueakTemp_startX * 2.
	_gsSqueakTemp_fwX2 := _gsSqueakTemp_startX + _gsSqueakTemp_endX - (_gsSqueakTemp_viaX * 2).
	_gsSqueakTemp_fwY1 := _gsSqueakTemp_viaY - _gsSqueakTemp_startY * 2.
	_gsSqueakTemp_fwY2 := _gsSqueakTemp_startY + _gsSqueakTemp_endY - (_gsSqueakTemp_viaY * 2).
	_gsSqueakTemp_maxSteps := _gsSqueakTemp_deltaY * 2.
	_gsSqueakTemp_maxSteps < 2
		ifTrue: [_gsSqueakTemp_maxSteps := 2].
	_gsSqueakTemp_scaledStepSize := 16777216 // _gsSqueakTemp_maxSteps.
	_gsSqueakTemp_squaredStepSize := self absoluteSquared8Dot24: _gsSqueakTemp_scaledStepSize.
	_gsSqueakTemp_fwDx := _gsSqueakTemp_fwX1 * _gsSqueakTemp_scaledStepSize.
	_gsSqueakTemp_fwDDx := _gsSqueakTemp_fwX2 * _gsSqueakTemp_squaredStepSize * 2.
	_gsSqueakTemp_fwDx := _gsSqueakTemp_fwDx + (_gsSqueakTemp_fwDDx // 2).
	_gsSqueakTemp_fwDy := _gsSqueakTemp_fwY1 * _gsSqueakTemp_scaledStepSize.
	_gsSqueakTemp_fwDDy := _gsSqueakTemp_fwY2 * _gsSqueakTemp_squaredStepSize * 2.
	_gsSqueakTemp_fwDy := _gsSqueakTemp_fwDy + (_gsSqueakTemp_fwDDy // 2).
	"Store the values"
	self edgeNumLinesOf: bezier put: _gsSqueakTemp_deltaY.
	_gsSqueakTemp_updateData := self bezierUpdateDataOf: bezier.
	_gsSqueakTemp_updateData at: GBUpdateX put: _gsSqueakTemp_startX * 256.
	_gsSqueakTemp_updateData at: GBUpdateY put: _gsSqueakTemp_startY * 256.
	_gsSqueakTemp_updateData at: GBUpdateDX put: _gsSqueakTemp_fwDx.
	_gsSqueakTemp_updateData at: GBUpdateDY put: _gsSqueakTemp_fwDy.
	_gsSqueakTemp_updateData at: GBUpdateDDX put: _gsSqueakTemp_fwDDx.
	_gsSqueakTemp_updateData at: GBUpdateDDY put: _gsSqueakTemp_fwDDy.
	"And step to the first scan line"
	(_gsSqueakTemp_startY := self edgeYValueOf: bezier) = yValue
		ifFalse: [self stepToNextBezierIn: bezier at: yValue.
			"Adjust number of lines remaining"
			self edgeNumLinesOf: bezier put: _gsSqueakTemp_deltaY - (yValue - _gsSqueakTemp_startY)]