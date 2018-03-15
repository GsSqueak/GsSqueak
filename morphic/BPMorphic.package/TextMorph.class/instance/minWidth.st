layout
minWidth
	| _gsSqueakTemp_result |
	textStyle
		ifNil: [^ 9].
	borderWidth
		ifNil: [^ 9].
	_gsSqueakTemp_result := 9 + (borderWidth * 2).
	margins
		ifNil: [^ _gsSqueakTemp_result].
	^ margins isRectangle
		ifTrue: [_gsSqueakTemp_result + margins left + margins right]
		ifFalse: [margins isPoint
				ifTrue: [_gsSqueakTemp_result + margins x + margins x]
				ifFalse: [_gsSqueakTemp_result + (2 * margins)]]