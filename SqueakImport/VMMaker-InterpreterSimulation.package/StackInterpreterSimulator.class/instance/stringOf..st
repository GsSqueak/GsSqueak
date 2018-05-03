debug support
stringOf: oop
	| size long nLongs chars |
	^ String streamContents:
		[:strm |
		size := 100 min: (self stSizeOf: oop).
		nLongs := size-1//objectMemory bytesPerWord+1.
		1 to: nLongs do:
			[:i | long := self longAt: oop + objectMemory baseHeaderSize + (i-1*objectMemory bytesPerWord).
			chars := self charsOfLong: long.
			strm nextPutAll: (i=nLongs
							ifTrue: [chars copyFrom: 1 to: size-1\\objectMemory bytesPerWord+1]
							ifFalse: [chars])]]