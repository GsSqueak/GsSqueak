displaying
fillAllFrom: leftX to: rightX 
	"Fill the span buffer from leftX to rightX with the given fill."
	| _gsSqueakTemp_fill _gsSqueakTemp_startX _gsSqueakTemp_stopX |
	_gsSqueakTemp_fill := self topFill.
	_gsSqueakTemp_startX := leftX.
	_gsSqueakTemp_stopX := self topRightX.
	[_gsSqueakTemp_stopX < rightX]
		whileTrue: [_gsSqueakTemp_fill := self makeUnsignedFrom: self topFill.
			_gsSqueakTemp_fill = 0
				ifFalse: [(self
							fillSpan: _gsSqueakTemp_fill
							from: _gsSqueakTemp_startX
							to: _gsSqueakTemp_stopX)
						ifTrue: [^ true]].
			self quickRemoveInvalidFillsAt: _gsSqueakTemp_stopX.
			_gsSqueakTemp_startX := _gsSqueakTemp_stopX.
			_gsSqueakTemp_stopX := self topRightX].
	_gsSqueakTemp_fill := self makeUnsignedFrom: self topFill.
	_gsSqueakTemp_fill = 0
		ifFalse: [^ self
				fillSpan: _gsSqueakTemp_fill
				from: _gsSqueakTemp_startX
				to: rightX].
	^ false