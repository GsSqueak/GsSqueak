object access primitives
primitiveSetIdentityHash
	| _gsSqueakTemp_hash _gsSqueakTemp_oldHash _gsSqueakTemp_thisReceiver |
	_gsSqueakTemp_hash := self stackIntegerValue: 0.
	_gsSqueakTemp_thisReceiver := self stackObjectValue: 1.
	self successful
		ifTrue: [_gsSqueakTemp_oldHash := objectMemory hashBitsOf: _gsSqueakTemp_thisReceiver.
			objectMemory setHashBitsOf: _gsSqueakTemp_thisReceiver to: _gsSqueakTemp_hash.
			self pop: argumentCount + 1 thenPushInteger: _gsSqueakTemp_oldHash]