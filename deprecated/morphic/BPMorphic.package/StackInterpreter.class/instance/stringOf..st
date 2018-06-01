debug support
stringOf: oop 
	| _gsSqueakTemp_size _gsSqueakTemp_long _gsSqueakTemp_nLongs _gsSqueakTemp_chars |
	^ String
		streamContents: [:strm | 
			_gsSqueakTemp_size := 128
						min: (self stSizeOf: oop).
			_gsSqueakTemp_nLongs := _gsSqueakTemp_size - 1 // objectMemory wordSize + 1.
			1
				to: _gsSqueakTemp_nLongs
				do: [:i | 
					_gsSqueakTemp_long := objectMemory longAt: oop + objectMemory baseHeaderSize + (i - 1 * objectMemory wordSize).
					_gsSqueakTemp_chars := self charsOfLong: _gsSqueakTemp_long.
					strm
						nextPutAll: (i = _gsSqueakTemp_nLongs
								ifTrue: [_gsSqueakTemp_chars copyFrom: 1 to: _gsSqueakTemp_size - 1 \\ objectMemory wordSize + 1]
								ifFalse: [_gsSqueakTemp_chars])]]