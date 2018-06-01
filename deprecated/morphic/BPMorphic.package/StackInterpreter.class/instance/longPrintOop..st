debug printing
longPrintOop: oop 
	| _gsSqueakTemp_fmt _gsSqueakTemp_lastIndex _gsSqueakTemp_startIP _gsSqueakTemp_bytecodesPerLine _gsSqueakTemp_column |
	((objectMemory isImmediate: oop)
			or: [(objectMemory addressCouldBeObj: oop) not
					or: [(oop bitAnd: objectMemory allocationUnit - 1)
								~= 0
							or: [(objectMemory isFreeObject: oop)
									or: [objectMemory isForwarded: oop]]]])
		ifTrue: [self printOop: oop.
			^ self].
	self printHex: oop.
	(objectMemory fetchClassOfNonImm: oop)
		ifNil: [self print: ' has a nil class!!']
		ifNotNil: [:class | 
			self print: ': a(n) ';
				 printNameOfClass: class count: 5;
				 print: ' ('.
			objectMemory hasSpurMemoryManagerAPI
				ifTrue: [self
						printHexnp: (objectMemory compactClassIndexOf: oop);
						 print: '=>'].
			self printHexnp: class;
				 print: ')'].
	_gsSqueakTemp_fmt := objectMemory formatOf: oop.
	self print: ' format ';
		 printHexnp: _gsSqueakTemp_fmt.
	_gsSqueakTemp_fmt > objectMemory lastPointerFormat
		ifTrue: [self print: ' nbytes ';
				
				printNum: (objectMemory numBytesOf: oop)]
		ifFalse: [(objectMemory isIndexableFormat: _gsSqueakTemp_fmt)
				ifTrue: [| len |
					len := objectMemory lengthOf: oop.
					self print: ' size ';
						 printNum: len
							- (objectMemory
									fixedFieldsOf: oop
									format: _gsSqueakTemp_fmt
									length: len)]].
	objectMemory printHeaderTypeOf: oop.
	self print: ' hash ';
		
		printHexnp: (objectMemory rawHashBitsOf: oop).
	self cr.
	(_gsSqueakTemp_fmt between: objectMemory firstByteFormat and: objectMemory firstCompiledMethodFormat - 1)
		ifTrue: [^ self printStringOf: oop;
				 cr].
	(_gsSqueakTemp_fmt between: objectMemory firstLongFormat and: objectMemory firstByteFormat - 1)
		ifTrue: [0
				to: ((objectMemory num32BitUnitsOf: oop)
						min: 256)
						- 1
				do: [:i | 
					| field32 |
					field32 := objectMemory fetchLong32: i ofObject: oop.
					self space; printNum: i; space; printHex: field32; space; cr].
			^ self].
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [_gsSqueakTemp_fmt = objectMemory sixtyFourBitIndexableFormat
				ifTrue: [0
						to: ((objectMemory num64BitUnitsOf: oop)
								min: 256)
								- 1
						do: [:i | 
							| field64 |
							field64 := objectMemory fetchLong64: i ofObject: oop.
							self space; printNum: i; space; printHex: field64; space; cr].
					^ self].
			(_gsSqueakTemp_fmt between: objectMemory firstShortFormat and: objectMemory firstShortFormat + 1)
				ifTrue: [0
						to: ((objectMemory num16BitUnitsOf: oop)
								min: 256)
								- 1
						do: [:i | 
							| field16 |
							field16 := objectMemory fetchShort16: i ofObject: oop.
							self space; printNum: i; space; printHex: field16; space; cr].
					^ self]].
	"this is nonsense. apologies."
	_gsSqueakTemp_startIP := (objectMemory lastPointerOf: oop)
				+ objectMemory bytesPerOop - objectMemory baseHeaderSize / objectMemory bytesPerOop.
	_gsSqueakTemp_lastIndex := 256 min: _gsSqueakTemp_startIP.
	_gsSqueakTemp_lastIndex > 0
		ifTrue: [1
				to: _gsSqueakTemp_lastIndex
				do: [:i | 
					| fieldOop |
					fieldOop := objectMemory fetchPointer: i - 1 ofObject: oop.
					self space; printNum: i - 1; space; printHex: fieldOop; space.
					(i = 1
							and: [objectMemory isCompiledMethod: oop])
						ifTrue: [self printMethodHeaderOop: fieldOop]
						ifFalse: [self
								cCode: [self printOopShort: fieldOop]
								inSmalltalk: [self
										print: (self shortPrint: fieldOop)]].
					self cr]].
	(objectMemory isCompiledMethod: oop)
		ifTrue: [_gsSqueakTemp_startIP := _gsSqueakTemp_startIP * objectMemory wordSize + 1.
			_gsSqueakTemp_lastIndex := objectMemory lengthOf: oop.
			_gsSqueakTemp_lastIndex - _gsSqueakTemp_startIP > 100
				ifTrue: [_gsSqueakTemp_lastIndex := _gsSqueakTemp_startIP + 100].
			_gsSqueakTemp_bytecodesPerLine := 8.
			_gsSqueakTemp_column := 1.
			_gsSqueakTemp_startIP
				to: _gsSqueakTemp_lastIndex
				do: [:index | 
					| byte |
					_gsSqueakTemp_column = 1
						ifTrue: [self
								cCode: 'printf("0x%08" PRIxSQPTR ": ", (usqIntptr_t)(oop+BaseHeaderSize+index-1))'
								inSmalltalk: [self print: (oop + objectMemory baseHeaderSize + index - 1) hex;
										 print: ': ']].
					byte := objectMemory fetchByte: index - 1 ofObject: oop.
					self
						cCode: 'printf(" %02x/%-3d", (int)byte,(int)byte)'
						inSmalltalk: [self space;
								print: (byte radix: 16); printChar: $/; printNum: byte].
					_gsSqueakTemp_column := _gsSqueakTemp_column + 1.
					_gsSqueakTemp_column > _gsSqueakTemp_bytecodesPerLine
						ifTrue: [_gsSqueakTemp_column := 1.
							self cr]].
			_gsSqueakTemp_column = 1
				ifFalse: [self cr]]
		ifFalse: [_gsSqueakTemp_startIP > _gsSqueakTemp_lastIndex
				ifTrue: [self print: '...';
						 cr]]