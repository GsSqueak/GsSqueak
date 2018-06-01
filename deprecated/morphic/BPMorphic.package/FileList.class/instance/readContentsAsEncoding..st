private
readContentsAsEncoding: encodingName 
	| _gsSqueakTemp_f _gsSqueakTemp_writeStream _gsSqueakTemp_converter _gsSqueakTemp_c |
	_gsSqueakTemp_f := directory oldFileOrNoneNamed: self fullName.
	_gsSqueakTemp_f
		ifNil: [^ 'For some reason, this file cannot be read'].
	_gsSqueakTemp_writeStream := WriteStream on: String new.
	_gsSqueakTemp_converter := TextConverter defaultConverterClassForEncoding: encodingName.
	_gsSqueakTemp_converter
		ifNil: [^ 'This encoding is not supported'].
	_gsSqueakTemp_f converter: _gsSqueakTemp_converter new.
	_gsSqueakTemp_f wantsLineEndConversion: true.
	[_gsSqueakTemp_f atEnd
		or: [(_gsSqueakTemp_c := _gsSqueakTemp_f next) isNil]]
		whileFalse: [_gsSqueakTemp_writeStream nextPut: _gsSqueakTemp_c].
	_gsSqueakTemp_f close.
	^ _gsSqueakTemp_writeStream contents