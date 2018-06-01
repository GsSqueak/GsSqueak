sound primitives
primitiveConstantFillSpur
	"Fill the receiver, which must be an indexable non-pointer object, with
	the given integer value."
	| _gsSqueakTemp_fillValue _gsSqueakTemp_rcvr _gsSqueakTemp_format _gsSqueakTemp_end _gsSqueakTemp_i _gsSqueakTemp_oddBytes |
	_gsSqueakTemp_fillValue := self positive64BitValueOf: self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(self successful
			and: [(objectMemory isNonImmediate: _gsSqueakTemp_rcvr)
					and: [(_gsSqueakTemp_format := objectMemory formatOf: _gsSqueakTemp_rcvr) >= objectMemory sixtyFourBitIndexableFormat]])
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_format >= objectMemory firstShortFormat
		ifTrue: [_gsSqueakTemp_format >= objectMemory firstByteFormat
				ifTrue: [(_gsSqueakTemp_fillValue > 255
							or: [_gsSqueakTemp_format >= objectMemory firstCompiledMethodFormat])
						ifTrue: [^ self primitiveFail].
					_gsSqueakTemp_fillValue := _gsSqueakTemp_fillValue + (_gsSqueakTemp_fillValue << 8) + (_gsSqueakTemp_fillValue << 16) + (_gsSqueakTemp_fillValue << 24).
					_gsSqueakTemp_oddBytes := _gsSqueakTemp_format bitAnd: 7]
				ifFalse: [_gsSqueakTemp_fillValue > 65535
						ifTrue: [^ self primitiveFail].
					_gsSqueakTemp_fillValue := _gsSqueakTemp_fillValue + (_gsSqueakTemp_fillValue << 16).
					_gsSqueakTemp_oddBytes := (_gsSqueakTemp_format bitAnd: 3)
								<< 1].
			_gsSqueakTemp_fillValue := _gsSqueakTemp_fillValue + (_gsSqueakTemp_fillValue << 32)]
		ifFalse: [_gsSqueakTemp_format = objectMemory sixtyFourBitIndexableFormat
				ifTrue: [_gsSqueakTemp_oddBytes := 0]
				ifFalse: [_gsSqueakTemp_fillValue > 4294967295
						ifTrue: [^ self primitiveFail].
					_gsSqueakTemp_fillValue := _gsSqueakTemp_fillValue + (_gsSqueakTemp_fillValue << 32).
					_gsSqueakTemp_oddBytes := (_gsSqueakTemp_format bitAnd: 1)
								<< 2]].
	_gsSqueakTemp_end := objectMemory addressAfter: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_i := _gsSqueakTemp_rcvr + objectMemory baseHeaderSize.
	[_gsSqueakTemp_i < _gsSqueakTemp_end]
		whileTrue: [objectMemory long64At: _gsSqueakTemp_i put: _gsSqueakTemp_fillValue.
			_gsSqueakTemp_i := _gsSqueakTemp_i + 8].
	"now ensure trailing bytes are zero"
	_gsSqueakTemp_oddBytes > 0
		ifTrue: [self flag: #endianness.
			_gsSqueakTemp_fillValue := _gsSqueakTemp_fillValue >> (8 * _gsSqueakTemp_oddBytes).
			objectMemory long64At: _gsSqueakTemp_i - 8 put: _gsSqueakTemp_fillValue].
	self pop: 1