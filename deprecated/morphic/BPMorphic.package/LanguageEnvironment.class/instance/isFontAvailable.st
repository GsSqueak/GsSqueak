fonts support
isFontAvailable
	| _gsSqueakTemp_encoding _gsSqueakTemp_f |
	_gsSqueakTemp_encoding := self leadingChar + 1.
	_gsSqueakTemp_f := TextStyle defaultFont.
	_gsSqueakTemp_f isFontSet
		ifTrue: [_gsSqueakTemp_f fontArray
				at: _gsSqueakTemp_encoding
				ifAbsent: [^ false].
			^ true].
	_gsSqueakTemp_encoding = 1
		ifTrue: [^ true].
	_gsSqueakTemp_f fallbackFont isFontSet
		ifFalse: [^ false].
	_gsSqueakTemp_f fallbackFont fontArray
		at: _gsSqueakTemp_encoding
		ifAbsent: [^ false].
	^ true