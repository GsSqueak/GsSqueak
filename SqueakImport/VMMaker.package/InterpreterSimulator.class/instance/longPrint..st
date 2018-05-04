debug support
longPrint: oop
	| lastPtr val lastLong hdrType prevVal |
	(objectMemory isIntegerObject: oop) ifTrue: [^ self shortPrint: oop].
	^ String streamContents:
		[:strm |
		lastPtr := 64 * bytesPerWord min: (objectMemory lastPointerOf: oop).
		hdrType := objectMemory headerType: oop.
		hdrType = 2 ifTrue: [lastPtr := 0].
		prevVal := 0.
		(self headerStart: oop) to: lastPtr by: bytesPerWord do:
			[:a | val := objectMemory longAt: oop+a.
			(a > 0 and: [(val = prevVal) & (a ~= lastPtr)])
			ifTrue:
			[prevVal = (objectMemory longAt: oop + a - (bytesPerWord * 2)) ifFalse: [strm cr; nextPutAll: '        ...etc...']]
			ifFalse:
			[strm cr; nextPutAll: (a<16 ifTrue: [' ', a hex] ifFalse: [a hex]); 
				space; space; space; nextPutAll: val hex8; space; space.
			a = (bytesPerWord * 2) negated ifTrue:
				[strm nextPutAll: 'size = ' , (val - hdrType) hex].
			a = bytesPerWord negated ifTrue:
				[strm nextPutAll: '<' , (self nameOfClass: (val - hdrType)) , '>'].
			a = 0 ifTrue: [strm cr; tab; nextPutAll: (self dumpHeader: val)].
			a > 0 ifTrue: [strm nextPutAll: (self shortPrint: val)].
			a = bytesPerWord ifTrue:
				[(objectMemory fetchClassOf: oop) = (objectMemory splObj: ClassCompiledMethod) ifTrue:
							[strm cr; tab; nextPutAll: (self dumpMethodHeader: val)]]].
			prevVal := val].
		lastLong := 256 min: (objectMemory sizeBitsOf: oop) - objectMemory baseHeaderSize.
		hdrType = 2
			ifTrue:
			["free" strm cr; nextPutAll: (oop+(objectMemory longAt: oop)-2) hex;
			space; space; nextPutAll: (oop+(objectMemory longAt: oop)-2) printString]
			ifFalse:
			[(objectMemory formatOf: oop) = 3
			ifTrue:
				[strm cr; tab; nextPutAll: '/ next 3 fields are above SP... /'.
				lastPtr + bytesPerWord to: lastPtr+(3 * bytesPerWord) by: bytesPerWord do:
					[:a | val := objectMemory longAt: oop+a.
					strm cr; nextPutAll: a hex; 
						space; space; space; nextPutAll: val hex8; space; space.
					(self validOop: val) ifTrue: [strm nextPutAll: (self shortPrint: val)]]]
			ifFalse:
			[lastPtr + bytesPerWord to: lastLong by: bytesPerWord do:
				[:a | val := objectMemory longAt: oop+a.
				strm cr; nextPutAll: (a<16 ifTrue: [' ', a hex] ifFalse: [a hex]); 
					space; space; space.
				strm nextPutAll: val hex8; space; space;
						nextPutAll: (self charsOfLong: val)]]].
	]