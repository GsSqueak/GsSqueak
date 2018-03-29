stack pages
highBit: anUnsignedValue 
	"This is a C implementation needed by ioSetMaxExtSemTableSize
	and e.g. stackPageByteSize."
	| _gsSqueakTemp_shifted _gsSqueakTemp_bitNo |
	"so it shows up in senders..."
	_gsSqueakTemp_shifted := anUnsignedValue.
	_gsSqueakTemp_bitNo := 0.
	self
		cppIf: objectMemory wordSize > 4
		ifTrue: [_gsSqueakTemp_shifted < (1 << 32)
				ifFalse: [_gsSqueakTemp_shifted := _gsSqueakTemp_shifted >> 32.
					_gsSqueakTemp_bitNo := _gsSqueakTemp_bitNo + 32]].
	_gsSqueakTemp_shifted < (1 << 16)
		ifFalse: [_gsSqueakTemp_shifted := _gsSqueakTemp_shifted >> 16.
			_gsSqueakTemp_bitNo := _gsSqueakTemp_bitNo + 16].
	_gsSqueakTemp_shifted < (1 << 8)
		ifFalse: [_gsSqueakTemp_shifted := _gsSqueakTemp_shifted >> 8.
			_gsSqueakTemp_bitNo := _gsSqueakTemp_bitNo + 8].
	_gsSqueakTemp_shifted < (1 << 4)
		ifFalse: [_gsSqueakTemp_shifted := _gsSqueakTemp_shifted >> 4.
			_gsSqueakTemp_bitNo := _gsSqueakTemp_bitNo + 4].
	_gsSqueakTemp_shifted < (1 << 2)
		ifFalse: [_gsSqueakTemp_shifted := _gsSqueakTemp_shifted >> 2.
			_gsSqueakTemp_bitNo := _gsSqueakTemp_bitNo + 2].
	_gsSqueakTemp_shifted < (1 << 1)
		ifFalse: [_gsSqueakTemp_shifted := _gsSqueakTemp_shifted >> 1.
			_gsSqueakTemp_bitNo := _gsSqueakTemp_bitNo + 1].
	"shifted 0 or 1 now"
	^ _gsSqueakTemp_bitNo + _gsSqueakTemp_shifted