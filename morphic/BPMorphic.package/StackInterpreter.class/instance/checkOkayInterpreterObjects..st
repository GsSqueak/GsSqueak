debug support
checkOkayInterpreterObjects: writeBack 
	| _gsSqueakTemp_ok _gsSqueakTemp_oopOrZero _gsSqueakTemp_oop |
	_gsSqueakTemp_ok := true.
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: objectMemory nilObject).
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: objectMemory falseObject).
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: objectMemory trueObject).
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: objectMemory specialObjectsOop).
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: messageSelector).
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: newMethod).
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayFields: lkupClass).
	0
		to: MethodCacheEntries - 1
		by: MethodCacheEntrySize
		do: [:i | 
			_gsSqueakTemp_oopOrZero := methodCache at: i + MethodCacheSelector.
			_gsSqueakTemp_oopOrZero = 0
				ifFalse: [_gsSqueakTemp_ok := _gsSqueakTemp_ok
								& (self
										checkOkayFields: (methodCache at: i + MethodCacheSelector)).
					objectMemory hasSpurMemoryManagerAPI
						ifFalse: [_gsSqueakTemp_ok := _gsSqueakTemp_ok
										& (self
												checkOkayFields: (methodCache at: i + MethodCacheClass))].
					_gsSqueakTemp_ok := _gsSqueakTemp_ok
								& (self
										checkOkayFields: (methodCache at: i + MethodCacheMethod))]].
	1
		to: objectMemory remapBufferCount
		do: [:i | 
			_gsSqueakTemp_oop := objectMemory remapBuffer at: i.
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [_gsSqueakTemp_ok := _gsSqueakTemp_ok
								& (self checkOkayFields: _gsSqueakTemp_oop)]].
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self checkOkayStackZone: writeBack).
	^ _gsSqueakTemp_ok