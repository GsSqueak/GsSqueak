lines-loading
loadWideLine: lineWidth from: p1 to: p2 lineFill: lineFill leftFill: leftFill rightFill: rightFill 
	"Load a (possibly wide) line defined by the points p1 and p2"
	| _gsSqueakTemp_line _gsSqueakTemp_offset |
	(lineWidth = 0
			or: [lineFill = 0])
		ifTrue: [_gsSqueakTemp_line := self allocateLine.
			_gsSqueakTemp_offset := 0]
		ifFalse: [_gsSqueakTemp_line := self allocateWideLine.
			_gsSqueakTemp_offset := self offsetFromWidth: lineWidth].
	engineStopped
		ifTrue: [^ 0].
	self
		loadLine: _gsSqueakTemp_line
		from: p1
		to: p2
		offset: _gsSqueakTemp_offset
		leftFill: leftFill
		rightFill: rightFill.
	(self isWide: _gsSqueakTemp_line)
		ifTrue: [self wideLineFillOf: _gsSqueakTemp_line put: lineFill.
			self wideLineWidthOf: _gsSqueakTemp_line put: lineWidth.
			self wideLineExtentOf: _gsSqueakTemp_line put: lineWidth]