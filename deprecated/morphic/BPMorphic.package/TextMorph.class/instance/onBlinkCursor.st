blinking
onBlinkCursor
	| _gsSqueakTemp_para |
	_gsSqueakTemp_para := paragraph
				ifNil: [^ nil].
	Time millisecondClockValue < self blinkStart
		ifTrue: [_gsSqueakTemp_para showCaret: _gsSqueakTemp_para focused]
		ifFalse: [_gsSqueakTemp_para showCaret: _gsSqueakTemp_para showCaret not].
	_gsSqueakTemp_para caretRect
		ifNotNil: [:r | self invalidRect: r]