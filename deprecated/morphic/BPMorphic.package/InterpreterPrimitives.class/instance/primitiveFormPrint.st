I/O primitives
primitiveFormPrint
	"On platforms that support it, this primitive prints the receiver,
	assumed to be a Form, to the default printer."
	| _gsSqueakTemp_landscapeFlag _gsSqueakTemp_vScale _gsSqueakTemp_hScale _gsSqueakTemp_rcvr _gsSqueakTemp_bitsArray _gsSqueakTemp_w _gsSqueakTemp_h _gsSqueakTemp_depth _gsSqueakTemp_pixelsPerWord _gsSqueakTemp_wordsPerLine _gsSqueakTemp_bitsArraySize _gsSqueakTemp_ok |
	_gsSqueakTemp_landscapeFlag := self booleanValueOf: self stackTop.
	_gsSqueakTemp_vScale := objectMemory
				floatValueOf: (self stackValue: 1).
	_gsSqueakTemp_hScale := objectMemory
				floatValueOf: (self stackValue: 2).
	_gsSqueakTemp_rcvr := self stackValue: 3.
	((objectMemory isPointers: _gsSqueakTemp_rcvr)
			and: [(objectMemory lengthOf: _gsSqueakTemp_rcvr)
					>= 4])
		ifFalse: [self success: false].
	self successful
		ifTrue: [_gsSqueakTemp_bitsArray := objectMemory fetchPointer: 0 ofObject: _gsSqueakTemp_rcvr.
			_gsSqueakTemp_w := self fetchInteger: 1 ofObject: _gsSqueakTemp_rcvr.
			_gsSqueakTemp_h := self fetchInteger: 2 ofObject: _gsSqueakTemp_rcvr.
			_gsSqueakTemp_depth := self fetchInteger: 3 ofObject: _gsSqueakTemp_rcvr.
			(_gsSqueakTemp_w > 0
					and: [_gsSqueakTemp_h > 0])
				ifFalse: [self success: false].
			_gsSqueakTemp_pixelsPerWord := 32 // _gsSqueakTemp_depth.
			_gsSqueakTemp_wordsPerLine := _gsSqueakTemp_w + (_gsSqueakTemp_pixelsPerWord - 1) // _gsSqueakTemp_pixelsPerWord.
			(objectMemory isWordsOrBytes: _gsSqueakTemp_bitsArray)
				ifTrue: [_gsSqueakTemp_bitsArraySize := objectMemory numBytesOf: _gsSqueakTemp_bitsArray.
					self success: _gsSqueakTemp_bitsArraySize = (_gsSqueakTemp_wordsPerLine * _gsSqueakTemp_h * 4)]
				ifFalse: [self success: false]].
	self successful
		ifTrue: [_gsSqueakTemp_ok := self cCode: 'ioFormPrint(bitsArray + BaseHeaderSize, w, h, depth, hScale, vScale, landscapeFlag)'.
			self success: _gsSqueakTemp_ok].
	self successful
		ifTrue: [self pop: 3
			"pop hScale, vScale, and landscapeFlag; leave rcvr on stack"]