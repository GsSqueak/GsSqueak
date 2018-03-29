object access primitives
primitiveAsCharacter
	| _gsSqueakTemp_characterCode _gsSqueakTemp_characterObject |
	_gsSqueakTemp_characterCode := self stackTop.
	((objectMemory isIntegerObject: _gsSqueakTemp_characterCode)
			and: [_gsSqueakTemp_characterCode := objectMemory integerValueOf: _gsSqueakTemp_characterCode.
				objectMemory isInRangeCharacterCode: _gsSqueakTemp_characterCode])
		ifFalse: [^ self
				primitiveFailFor: (argumentCount = 0
						ifTrue: [PrimErrBadReceiver]
						ifFalse: [PrimErrBadArgument])].
	_gsSqueakTemp_characterObject := self characterForAscii: _gsSqueakTemp_characterCode.
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_characterObject