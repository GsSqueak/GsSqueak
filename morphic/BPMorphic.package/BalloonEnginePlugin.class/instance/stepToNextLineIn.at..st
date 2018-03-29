lines-simple
stepToNextLineIn: line at: yValue 
	"Incrementally step to the next scan line in the given line"
	| _gsSqueakTemp_x _gsSqueakTemp_err |
	_gsSqueakTemp_x := (self edgeXValueOf: line)
				+ (self lineXIncrementOf: line).
	_gsSqueakTemp_err := (self lineErrorOf: line)
				+ (self lineErrorAdjUpOf: line).
	_gsSqueakTemp_err > 0
		ifTrue: [_gsSqueakTemp_x := _gsSqueakTemp_x
						+ (self lineXDirectionOf: line).
			_gsSqueakTemp_err := _gsSqueakTemp_err
						- (self lineErrorAdjDownOf: line)].
	self lineErrorOf: line put: _gsSqueakTemp_err.
	self edgeXValueOf: line put: _gsSqueakTemp_x