blinking
resetBlinkCursor
	"Reset the blinking cursor"
	| _gsSqueakTemp_para |
	self blinkStart: Time millisecondClockValue + 500.
	_gsSqueakTemp_para := paragraph
				ifNil: [^ self].
	_gsSqueakTemp_para showCaret = _gsSqueakTemp_para focused
		ifFalse: [_gsSqueakTemp_para caretRect
				ifNotNil: [:r | self invalidRect: r].
			_gsSqueakTemp_para showCaret: _gsSqueakTemp_para focused]