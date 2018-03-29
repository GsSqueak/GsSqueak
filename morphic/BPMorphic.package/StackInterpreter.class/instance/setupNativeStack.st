initialization
setupNativeStack
	"This initializes an alternate stack that is used by the Lowcode
	instructions "
	| _gsSqueakTemp_nativeStackMemorySize _gsSqueakTemp_theNativeStackMemory _gsSqueakTemp_shadowCallStackMemorySize _gsSqueakTemp_theShadowCallStackMemory |
	_gsSqueakTemp_nativeStackMemorySize := self nativeStackSize.
	_gsSqueakTemp_theNativeStackMemory := self
				cCode: [self malloc: _gsSqueakTemp_nativeStackMemorySize]
				inSmalltalk: [CArrayAccessor
						on: (ByteArray new: self nativeStackSize)].
	nativeStackPointer := _gsSqueakTemp_theNativeStackMemory + _gsSqueakTemp_nativeStackMemorySize.
	_gsSqueakTemp_shadowCallStackMemorySize := self shadowCallStackSize.
	_gsSqueakTemp_theShadowCallStackMemory := self
				cCode: [self malloc: _gsSqueakTemp_shadowCallStackMemorySize]
				inSmalltalk: [CArrayAccessor
						on: (ByteArray new: self shadowCallStackSize)].
	shadowCallStackPointer := _gsSqueakTemp_theShadowCallStackMemory + _gsSqueakTemp_shadowCallStackMemorySize