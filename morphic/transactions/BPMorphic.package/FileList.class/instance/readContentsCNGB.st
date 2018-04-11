private
readContentsCNGB
	| _gsSqueakTemp_f _gsSqueakTemp_writeStream |
	_gsSqueakTemp_f := directory oldFileOrNoneNamed: self fullName.
	_gsSqueakTemp_f
		ifNil: [^ 'For some reason, this file cannot be read'].
	_gsSqueakTemp_writeStream := WriteStream on: String new.
	_gsSqueakTemp_f converter: CNGBTextConverter new.
	[_gsSqueakTemp_f atEnd]
		whileFalse: [_gsSqueakTemp_writeStream nextPut: _gsSqueakTemp_f next].
	_gsSqueakTemp_f close.
	^ _gsSqueakTemp_writeStream contents