stack bytecodes
extendedStoreBytecodePop: popBoolean 
	| _gsSqueakTemp_descriptor _gsSqueakTemp_variableType _gsSqueakTemp_variableIndex _gsSqueakTemp_value |
	_gsSqueakTemp_descriptor := self fetchByte.
	_gsSqueakTemp_variableType := _gsSqueakTemp_descriptor >> 6 bitAnd: 3.
	_gsSqueakTemp_variableIndex := _gsSqueakTemp_descriptor bitAnd: 63.
	_gsSqueakTemp_value := self internalStackTop.
	popBoolean
		ifTrue: [self internalPop: 1].
	_gsSqueakTemp_variableType = 0
		ifTrue: [objectMemory
				storePointerImmutabilityCheck: _gsSqueakTemp_variableIndex
				ofObject: self receiver
				withValue: _gsSqueakTemp_value.
			^ self fetchNextBytecode].
	_gsSqueakTemp_variableType = 1
		ifTrue: [self fetchNextBytecode.
			^ self
				temporary: _gsSqueakTemp_variableIndex
				in: localFP
				put: _gsSqueakTemp_value].
	_gsSqueakTemp_variableType = 3
		ifTrue: [self storeLiteralVariable: _gsSqueakTemp_variableIndex withValue: _gsSqueakTemp_value.
			^ self fetchNextBytecode].
	self error: 'illegal store'