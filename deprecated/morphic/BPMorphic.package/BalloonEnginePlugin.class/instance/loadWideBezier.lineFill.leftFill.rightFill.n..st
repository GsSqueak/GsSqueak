bezier-loading
loadWideBezier: lineWidth lineFill: lineFill leftFill: leftFill rightFill: rightFill n: nSegments 
	"Load the (possibly wide) bezier from the segments currently on the
	bezier stack."
	| _gsSqueakTemp_index _gsSqueakTemp_bezier _gsSqueakTemp_wide _gsSqueakTemp_offset |
	(lineWidth = 0
			or: [lineFill = 0])
		ifTrue: [_gsSqueakTemp_wide := false.
			_gsSqueakTemp_offset := 0]
		ifFalse: [_gsSqueakTemp_wide := true.
			_gsSqueakTemp_offset := self offsetFromWidth: lineWidth].
	_gsSqueakTemp_index := nSegments * 6.
	[_gsSqueakTemp_index > 0]
		whileTrue: [_gsSqueakTemp_wide
				ifTrue: [_gsSqueakTemp_bezier := self allocateWideBezier]
				ifFalse: [_gsSqueakTemp_bezier := self allocateBezier].
			engineStopped
				ifTrue: [^ 0].
			self
				loadBezier: _gsSqueakTemp_bezier
				segment: _gsSqueakTemp_index
				leftFill: leftFill
				rightFill: rightFill
				offset: _gsSqueakTemp_offset.
			_gsSqueakTemp_wide
				ifTrue: [self wideBezierFillOf: _gsSqueakTemp_bezier put: lineFill.
					self wideBezierWidthOf: _gsSqueakTemp_bezier put: lineWidth.
					self wideBezierExtentOf: _gsSqueakTemp_bezier put: lineWidth].
			_gsSqueakTemp_index := _gsSqueakTemp_index - 6].
	self wbStackClear