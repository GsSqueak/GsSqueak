fills-bitmaps
repeatValue: delta max: maxValue 
	| _gsSqueakTemp_newDelta |
	_gsSqueakTemp_newDelta := delta.
	[_gsSqueakTemp_newDelta < 0]
		whileTrue: [_gsSqueakTemp_newDelta := _gsSqueakTemp_newDelta + maxValue].
	[_gsSqueakTemp_newDelta >= maxValue]
		whileTrue: [_gsSqueakTemp_newDelta := _gsSqueakTemp_newDelta - maxValue].
	^ _gsSqueakTemp_newDelta