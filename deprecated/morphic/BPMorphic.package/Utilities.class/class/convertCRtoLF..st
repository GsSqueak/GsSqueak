miscellaneous
convertCRtoLF: fileName 
	"Convert the given file to LF line endings. Put the result in a file with
	the extention '.lf'"
	| _gsSqueakTemp_in _gsSqueakTemp_out _gsSqueakTemp_c _gsSqueakTemp_justPutCR |
	_gsSqueakTemp_in := (FileStream readOnlyFileNamed: fileName) binary.
	_gsSqueakTemp_out := (FileStream newFileNamed: fileName , '.lf') binary.
	_gsSqueakTemp_justPutCR := false.
	[_gsSqueakTemp_in atEnd]
		whileFalse: [_gsSqueakTemp_c := _gsSqueakTemp_in next.
			_gsSqueakTemp_c = 10
				ifTrue: [_gsSqueakTemp_out nextPut: 13.
					_gsSqueakTemp_justPutCR := true]
				ifFalse: [(_gsSqueakTemp_justPutCR
							and: [_gsSqueakTemp_c = 10])
						ifFalse: [_gsSqueakTemp_out nextPut: _gsSqueakTemp_c].
					_gsSqueakTemp_justPutCR := false]].
	_gsSqueakTemp_in close.
	_gsSqueakTemp_out close