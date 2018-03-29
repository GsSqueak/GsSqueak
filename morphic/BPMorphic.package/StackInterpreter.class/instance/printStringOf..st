debug printing
printStringOf: oop 
	| _gsSqueakTemp_fmt _gsSqueakTemp_len _gsSqueakTemp_cnt _gsSqueakTemp_max _gsSqueakTemp_i |
	(objectMemory isImmediate: oop)
		ifTrue: [^ self].
	(objectMemory addressCouldBeObj: oop)
		ifFalse: [^ self].
	_gsSqueakTemp_fmt := objectMemory formatOf: oop.
	_gsSqueakTemp_fmt < objectMemory firstByteFormat
		ifTrue: [^ self].
	_gsSqueakTemp_cnt := (_gsSqueakTemp_max := 128) min: (_gsSqueakTemp_len := objectMemory lengthOf: oop).
	_gsSqueakTemp_i := 0.
	((objectMemory
				is: oop
				instanceOf: (objectMemory splObj: ClassByteArray)
				compactClassIndex: classByteArrayCompactIndex)
			or: [objectMemory isLargeIntegerInstance: oop])
		ifTrue: [[_gsSqueakTemp_i < _gsSqueakTemp_cnt]
				whileTrue: [self
						printHex: (objectMemory fetchByte: _gsSqueakTemp_i ofObject: oop).
					_gsSqueakTemp_i := _gsSqueakTemp_i + 1]]
		ifFalse: [[_gsSqueakTemp_i < _gsSqueakTemp_cnt]
				whileTrue: [self
						cCode: [(objectMemory fetchByte: _gsSqueakTemp_i ofObject: oop)
									= 13
								ifTrue: ["Character cr asInteger"
									self print: '<CR>'.
									_gsSqueakTemp_i + 1 < _gsSqueakTemp_len
										ifTrue: [self print: '...'].
									^ self]].
					self
						printChar: (objectMemory fetchByte: _gsSqueakTemp_i ofObject: oop).
					_gsSqueakTemp_i := _gsSqueakTemp_i + 1]].
	_gsSqueakTemp_len > _gsSqueakTemp_max
		ifTrue: [self print: '...'].
	self flush