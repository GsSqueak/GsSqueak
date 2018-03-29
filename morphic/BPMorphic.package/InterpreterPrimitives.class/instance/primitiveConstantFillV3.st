sound primitives
primitiveConstantFillV3
	"Fill the receiver, which must be an indexable bytes or words 
	object, with the given integer value."
	| _gsSqueakTemp_fillValue _gsSqueakTemp_rcvr _gsSqueakTemp_end _gsSqueakTemp_i |
	_gsSqueakTemp_fillValue := self positive32BitValueOf: self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	self
		success: (objectMemory isWordsOrBytes: _gsSqueakTemp_rcvr).
	(objectMemory isBytes: _gsSqueakTemp_rcvr)
		ifTrue: [self
				success: (_gsSqueakTemp_fillValue >= 0
						and: [_gsSqueakTemp_fillValue <= 255]).
			_gsSqueakTemp_fillValue := _gsSqueakTemp_fillValue + (_gsSqueakTemp_fillValue << 8) + (_gsSqueakTemp_fillValue << 16) + (_gsSqueakTemp_fillValue << 24)].
	self successful
		ifTrue: [_gsSqueakTemp_end := _gsSqueakTemp_rcvr
						+ (objectMemory sizeBitsOf: _gsSqueakTemp_rcvr).
			_gsSqueakTemp_i := _gsSqueakTemp_rcvr + objectMemory baseHeaderSize.
			[_gsSqueakTemp_i < _gsSqueakTemp_end]
				whileTrue: [objectMemory long32At: _gsSqueakTemp_i put: _gsSqueakTemp_fillValue.
					_gsSqueakTemp_i := _gsSqueakTemp_i + 4].
			self pop: 1]