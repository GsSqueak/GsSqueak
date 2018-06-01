debug printing
printOop: oop 
	| _gsSqueakTemp_cls _gsSqueakTemp_fmt _gsSqueakTemp_lastIndex _gsSqueakTemp_startIP _gsSqueakTemp_bytecodesPerLine _gsSqueakTemp_column |
	(objectMemory isImmediate: oop)
		ifTrue: [^ self shortPrintOop: oop].
	self printHex: oop.
	(objectMemory addressCouldBeObj: oop)
		ifFalse: [^ self
				print: ((oop bitAnd: objectMemory allocationUnit - 1)
							~= 0
						ifTrue: [' is misaligned']
						ifFalse: [self whereIs: oop]);
				 cr].
	(objectMemory isFreeObject: oop)
		ifTrue: [self print: ' is a free chunk of size ';
				
				printNum: (objectMemory sizeOfFree: oop).
			objectMemory hasSpurMemoryManagerAPI
				ifTrue: [self print: ' 0th: ';
						
						printHex: (objectMemory fetchPointer: 0 ofFreeChunk: oop).
					objectMemory printHeaderTypeOf: oop].
			^ self cr].
	(objectMemory isForwarded: oop)
		ifTrue: [self print: ' is a forwarded object to ';
				
				printHex: (objectMemory followForwarded: oop);
				 print: ' of slot size ';
				
				printNum: (objectMemory numSlotsOfAny: oop).
			objectMemory printHeaderTypeOf: oop.
			^ self cr].
	self print: ': a(n) '.
	self printNameOfClass: (_gsSqueakTemp_cls := objectMemory fetchClassOfNonImm: oop) count: 5.
	_gsSqueakTemp_cls
			= (objectMemory splObj: ClassFloat)
		ifTrue: [^ self cr;
				printFloat: (objectMemory dbgFloatValueOf: oop); cr].
	_gsSqueakTemp_fmt := objectMemory formatOf: oop.
	_gsSqueakTemp_fmt > objectMemory lastPointerFormat
		ifTrue: [self print: ' nbytes ';
				
				printNum: (objectMemory numBytesOf: oop)].
	self cr.
	(_gsSqueakTemp_fmt between: objectMemory firstLongFormat and: objectMemory firstCompiledMethodFormat - 1)
		ifTrue: ["This will answer false if splObj: ClassAlien is nilObject"
			(self
					is: oop
					KindOfClass: (objectMemory splObj: ClassAlien))
				ifTrue: [self print: ' datasize ';
						
						printNum: (self sizeOfAlienData: oop).
					self
						print: ((self isIndirectAlien: oop)
								ifTrue: [' indirect @ ']
								ifFalse: [(self isPointerAlien: oop)
										ifTrue: [' pointer @ ']
										ifFalse: [' direct @ ']]).
					^ self printHex: (self startOfAlienData: oop) asUnsignedInteger;
						 cr].
			(objectMemory isWordsNonImm: oop)
				ifTrue: [_gsSqueakTemp_lastIndex := 64 min: (objectMemory numBytesOf: oop)
									/ objectMemory wordSize.
					_gsSqueakTemp_lastIndex > 0
						ifTrue: [1
								to: _gsSqueakTemp_lastIndex
								do: [:index | 
									self space;
										printHex: (objectMemory fetchLong32: index - 1 ofObject: oop).
									index \\ self elementsPerPrintOopLine = 0
										ifTrue: [self cr]].
							_gsSqueakTemp_lastIndex \\ self elementsPerPrintOopLine = 0
								ifFalse: [self cr]].
					^ self].
			^ self printStringOf: oop;
				 cr].
	"this is nonsense. apologies."
	_gsSqueakTemp_startIP := (objectMemory lastPointerOf: oop)
				+ objectMemory bytesPerOop - objectMemory baseHeaderSize / objectMemory bytesPerOop.
	_gsSqueakTemp_lastIndex := 256 min: _gsSqueakTemp_startIP.
	_gsSqueakTemp_lastIndex > 0
		ifTrue: [1
				to: _gsSqueakTemp_lastIndex
				do: [:index | 
					self
						cCode: [self
								printHex: (objectMemory fetchPointer: index - 1 ofObject: oop);
								 space]
						inSmalltalk: [self space;
								printHex: (objectMemory fetchPointer: index - 1 ofObject: oop); space.
							self
								print: (self
										shortPrint: (objectMemory fetchPointer: index - 1 ofObject: oop))].
					index \\ self elementsPerPrintOopLine = 0
						ifTrue: [self cr]].
			_gsSqueakTemp_lastIndex \\ self elementsPerPrintOopLine = 0
				ifFalse: [self cr]].
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
		ifFalse: [_gsSqueakTemp_startIP > 64
				ifTrue: [self print: '...';
						 cr]]