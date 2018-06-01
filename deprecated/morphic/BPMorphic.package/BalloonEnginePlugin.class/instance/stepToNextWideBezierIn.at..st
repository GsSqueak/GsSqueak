beziers-wide
stepToNextWideBezierIn: bezier at: yValue 
	"Incrementally step to the next scan line in the given wide bezier"
	| _gsSqueakTemp_yEntry _gsSqueakTemp_yExit _gsSqueakTemp_lineWidth _gsSqueakTemp_lineOffset |
	"Don't inline this"
	_gsSqueakTemp_lineWidth := self wideBezierExtentOf: bezier.
	_gsSqueakTemp_lineOffset := self offsetFromWidth: _gsSqueakTemp_lineWidth.
	_gsSqueakTemp_yEntry := (self wideBezierEntryOf: bezier)
				+ 1.
	_gsSqueakTemp_yExit := (self wideBezierExitOf: bezier)
				+ 1.
	self wideBezierEntryOf: bezier put: _gsSqueakTemp_yEntry.
	self wideBezierExitOf: bezier put: _gsSqueakTemp_yExit.
	_gsSqueakTemp_yEntry >= _gsSqueakTemp_lineOffset
		ifTrue: [self edgeFillsValidate: bezier].
	_gsSqueakTemp_yExit >= 0
		ifTrue: [self edgeFillsInvalidate: bezier].
	"Check if we have to step the upper curve"
	_gsSqueakTemp_yExit + _gsSqueakTemp_lineOffset < 0
		ifTrue: [self
				stepToNextBezierForward: (self bezierUpdateDataOf: bezier)
				at: yValue]
		ifFalse: ["Adjust the last x value to the final x recorded previously"
			(self bezierUpdateDataOf: bezier)
				at: GBUpdateX
				put: (self bezierFinalXOf: bezier)
						* 256].
	"Step the lower curve"
	self
		stepToNextBezierForward: (self wideBezierUpdateDataOf: bezier)
		at: yValue.
	self computeFinalWideBezierValues: bezier width: _gsSqueakTemp_lineWidth