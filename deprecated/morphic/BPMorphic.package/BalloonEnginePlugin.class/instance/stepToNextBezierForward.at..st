beziers-simple
stepToNextBezierForward: updateData at: yValue 
	"Incrementally step to the next scan line in the given bezier update
	data. Note: This method has been written so that inlining works, e.g.,
	not declaring updateData as 'int*' but casting it on every use."
	| _gsSqueakTemp_minY _gsSqueakTemp_lastX _gsSqueakTemp_lastY _gsSqueakTemp_fwDx _gsSqueakTemp_fwDy |
	_gsSqueakTemp_lastX := updateData at: GBUpdateX.
	_gsSqueakTemp_lastY := updateData at: GBUpdateY.
	_gsSqueakTemp_fwDx := updateData at: GBUpdateDX.
	_gsSqueakTemp_fwDy := updateData at: GBUpdateDY.
	_gsSqueakTemp_minY := yValue * 256.
	"Step as long as we haven't yet reached minY and also
	as long as fwDy is greater than zero thus stepping down.
	Note: The test for fwDy should not be necessary in theory
	but is a good insurance in practice."
	[_gsSqueakTemp_minY > _gsSqueakTemp_lastY
		and: [_gsSqueakTemp_fwDy >= 0]]
		whileTrue: [_gsSqueakTemp_lastX := _gsSqueakTemp_lastX
						+ (_gsSqueakTemp_fwDx + 32768 signedBitShift: -16).
			_gsSqueakTemp_lastY := _gsSqueakTemp_lastY
						+ (_gsSqueakTemp_fwDy + 32768 signedBitShift: -16).
			_gsSqueakTemp_fwDx := _gsSqueakTemp_fwDx
						+ (updateData at: GBUpdateDDX).
			_gsSqueakTemp_fwDy := _gsSqueakTemp_fwDy
						+ (updateData at: GBUpdateDDY)].
	updateData at: GBUpdateX put: _gsSqueakTemp_lastX.
	updateData at: GBUpdateY put: _gsSqueakTemp_lastY.
	updateData at: GBUpdateDX put: _gsSqueakTemp_fwDx.
	updateData at: GBUpdateDY put: _gsSqueakTemp_fwDy.
	^ _gsSqueakTemp_lastX signedBitShift: -8