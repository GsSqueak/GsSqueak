I/O primitives
primitiveBeCursor
	"Set the cursor to the given shape. The Mac only supports 16x16 pixel
	cursors. Cursor offsets are handled by Smalltalk."
	| _gsSqueakTemp_cursorObj _gsSqueakTemp_maskBitsIndex _gsSqueakTemp_maskObj _gsSqueakTemp_bitsObj _gsSqueakTemp_extentX _gsSqueakTemp_extentY _gsSqueakTemp_depth _gsSqueakTemp_offsetObj _gsSqueakTemp_offsetX _gsSqueakTemp_offsetY _gsSqueakTemp_cursorBitsIndex _gsSqueakTemp_ourCursor |
	argumentCount = 0
		ifTrue: [_gsSqueakTemp_cursorObj := self stackTop.
			_gsSqueakTemp_maskBitsIndex := nil].
	argumentCount = 1
		ifTrue: [_gsSqueakTemp_cursorObj := self stackValue: 1.
			_gsSqueakTemp_maskObj := self stackTop].
	self success: argumentCount < 2.
	self successful
		ifTrue: [self
				success: ((objectMemory isPointers: _gsSqueakTemp_cursorObj)
						and: [(objectMemory lengthOf: _gsSqueakTemp_cursorObj)
								>= 5])].
	self successful
		ifTrue: [_gsSqueakTemp_bitsObj := objectMemory fetchPointer: 0 ofObject: _gsSqueakTemp_cursorObj.
			_gsSqueakTemp_extentX := self fetchInteger: 1 ofObject: _gsSqueakTemp_cursorObj.
			_gsSqueakTemp_extentY := self fetchInteger: 2 ofObject: _gsSqueakTemp_cursorObj.
			_gsSqueakTemp_depth := self fetchInteger: 3 ofObject: _gsSqueakTemp_cursorObj.
			_gsSqueakTemp_offsetObj := objectMemory fetchPointer: 4 ofObject: _gsSqueakTemp_cursorObj.
			self
				success: ((objectMemory isPointers: _gsSqueakTemp_offsetObj)
						and: [(objectMemory lengthOf: _gsSqueakTemp_offsetObj)
								>= 2])].
	self successful
		ifTrue: [_gsSqueakTemp_offsetX := self fetchInteger: 0 ofObject: _gsSqueakTemp_offsetObj.
			_gsSqueakTemp_offsetY := self fetchInteger: 1 ofObject: _gsSqueakTemp_offsetObj.
			(argumentCount = 0
					and: [_gsSqueakTemp_depth = 32])
				ifTrue: ["Support arbitrary-sized 32 bit ARGB forms --bf
					3/1/2007 23:51"
					self
						success: (_gsSqueakTemp_extentX > 0
								and: [_gsSqueakTemp_extentY > 0]).
					self
						success: (_gsSqueakTemp_offsetX >= (_gsSqueakTemp_extentX * -1)
								and: [_gsSqueakTemp_offsetX <= 0]).
					self
						success: (_gsSqueakTemp_offsetY >= (_gsSqueakTemp_extentY * -1)
								and: [_gsSqueakTemp_offsetY <= 0]).
					self
						success: ((objectMemory isWords: _gsSqueakTemp_bitsObj)
								and: [(objectMemory lengthOf: _gsSqueakTemp_bitsObj)
										= (_gsSqueakTemp_extentX * _gsSqueakTemp_extentY)]).
					_gsSqueakTemp_cursorBitsIndex := _gsSqueakTemp_bitsObj + objectMemory baseHeaderSize.
					self
						cCode: ''
						inSmalltalk: [_gsSqueakTemp_ourCursor := Cursor
										extent: _gsSqueakTemp_extentX @ _gsSqueakTemp_extentY
										depth: 32
										fromArray: ((1 to: _gsSqueakTemp_extentX * _gsSqueakTemp_extentY)
												collect: [:i | objectMemory fetchLong32: i - 1 ofObject: _gsSqueakTemp_bitsObj])
										offset: _gsSqueakTemp_offsetX @ _gsSqueakTemp_offsetY]]
				ifFalse: [self
						success: (_gsSqueakTemp_extentX = 16
								and: [_gsSqueakTemp_extentY = 16
										and: [_gsSqueakTemp_depth = 1]]).
					self
						success: (_gsSqueakTemp_offsetX >= -16
								and: [_gsSqueakTemp_offsetX <= 0]).
					self
						success: (_gsSqueakTemp_offsetY >= -16
								and: [_gsSqueakTemp_offsetY <= 0]).
					self
						success: ((objectMemory isWords: _gsSqueakTemp_bitsObj)
								and: [(objectMemory lengthOf: _gsSqueakTemp_bitsObj)
										= 16]).
					_gsSqueakTemp_cursorBitsIndex := _gsSqueakTemp_bitsObj + objectMemory baseHeaderSize.
					self
						cCode: ''
						inSmalltalk: [_gsSqueakTemp_ourCursor := Cursor
										extent: _gsSqueakTemp_extentX @ _gsSqueakTemp_extentY
										fromArray: ((1 to: 16)
												collect: [:i | (objectMemory fetchLong32: i - 1 ofObject: _gsSqueakTemp_bitsObj)
														>> (objectMemory wordSize * 8 - 16) bitAnd: 65535])
										offset: _gsSqueakTemp_offsetX @ _gsSqueakTemp_offsetY]]].
	argumentCount = 1
		ifTrue: [self
				success: ((objectMemory isPointers: _gsSqueakTemp_maskObj)
						and: [(objectMemory lengthOf: _gsSqueakTemp_maskObj)
								>= 5]).
			self successful
				ifTrue: [_gsSqueakTemp_bitsObj := objectMemory fetchPointer: 0 ofObject: _gsSqueakTemp_maskObj.
					_gsSqueakTemp_extentX := self fetchInteger: 1 ofObject: _gsSqueakTemp_maskObj.
					_gsSqueakTemp_extentY := self fetchInteger: 2 ofObject: _gsSqueakTemp_maskObj.
					_gsSqueakTemp_depth := self fetchInteger: 3 ofObject: _gsSqueakTemp_maskObj].
			self successful
				ifTrue: [self
						success: (_gsSqueakTemp_extentX = 16
								and: [_gsSqueakTemp_extentY = 16
										and: [_gsSqueakTemp_depth = 1]]).
					self
						success: ((objectMemory isWords: _gsSqueakTemp_bitsObj)
								and: [(objectMemory lengthOf: _gsSqueakTemp_bitsObj)
										= 16]).
					_gsSqueakTemp_maskBitsIndex := _gsSqueakTemp_bitsObj + objectMemory baseHeaderSize]].
	self successful
		ifTrue: [argumentCount = 0
				ifTrue: [_gsSqueakTemp_depth = 32
						ifTrue: [(self
									cCode: 'ioSetCursorARGB(cursorBitsIndex, extentX, extentY, offsetX, offsetY)'
									inSmalltalk: [_gsSqueakTemp_ourCursor show.
										Cursor currentCursor == _gsSqueakTemp_ourCursor])
								ifFalse: [^ self success: false]]
						ifFalse: [self
								cCode: 'ioSetCursor(cursorBitsIndex, offsetX, offsetY)'
								inSmalltalk: [_gsSqueakTemp_ourCursor show]]]
				ifFalse: [self
						cCode: 'ioSetCursorWithMask(cursorBitsIndex, maskBitsIndex, offsetX, offsetY)'
						inSmalltalk: [_gsSqueakTemp_cursorBitsIndex == _gsSqueakTemp_maskBitsIndex.
							"placate compiler"
							_gsSqueakTemp_ourCursor show]].
			self pop: argumentCount]