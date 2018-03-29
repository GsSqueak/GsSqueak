primitive support
externalQuickPrimitiveResponse
	"Invoke a quick primitive.
	Called under the assumption that primFunctionPtr has been
	preloaded "
	| _gsSqueakTemp_localPrimIndex |
	self assert: self isPrimitiveFunctionPointerAnIndex.
	_gsSqueakTemp_localPrimIndex := self cCoerceSimple: primitiveFunctionPointer to: #sqInt.
	self
		assert: (_gsSqueakTemp_localPrimIndex > 255
				and: [_gsSqueakTemp_localPrimIndex < 520]).
	"Quick return inst vars"
	_gsSqueakTemp_localPrimIndex >= 264
		ifTrue: [self
				pop: 1
				thenPush: (objectMemory fetchPointer: _gsSqueakTemp_localPrimIndex - 264 ofObject: self stackTop).
			^ true].
	"Quick return constants"
	_gsSqueakTemp_localPrimIndex = 256
		ifTrue: [^ true].
	_gsSqueakTemp_localPrimIndex = 257
		ifTrue: [self pop: 1 thenPush: objectMemory trueObject.
			^ true].
	_gsSqueakTemp_localPrimIndex = 258
		ifTrue: [self pop: 1 thenPush: objectMemory falseObject.
			^ true].
	_gsSqueakTemp_localPrimIndex = 259
		ifTrue: [self pop: 1 thenPush: objectMemory nilObject.
			^ true].
	self
		pop: 1
		thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_localPrimIndex - 261).
	^ true