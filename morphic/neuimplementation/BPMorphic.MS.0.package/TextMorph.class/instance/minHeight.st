layout
minHeight
	| _gsSqueakTemp_result |
	textStyle
		ifNil: [^ 16].
	borderWidth
		ifNil: [^ 16].
	_gsSqueakTemp_result := textStyle lineGrid + 2 + (borderWidth * 2).
	margins
		ifNil: [^ _gsSqueakTemp_result].
	^ margins isRectangle
		ifTrue: [_gsSqueakTemp_result + margins top + margins bottom]
		ifFalse: [margins isPoint
				ifTrue: [_gsSqueakTemp_result + margins y + margins y]
				ifFalse: [_gsSqueakTemp_result + (2 * margins)]]