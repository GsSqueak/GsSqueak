debug support
findSelectorAndClassForMethod: meth lookupClass: startClass do: binaryBlock 
	"Search startClass' class hierarchy searching for method and if found,
	evaluate aBinaryBlock
	with the selector and class where the method is found. Otherwise
	evaluate aBinaryBlock
	with doesNotUnderstand: and nil."
	| _gsSqueakTemp_currClass _gsSqueakTemp_classDict _gsSqueakTemp_classDictSize _gsSqueakTemp_methodArray _gsSqueakTemp_i |
	_gsSqueakTemp_currClass := startClass.
	[_gsSqueakTemp_classDict := objectMemory fetchPointer: MethodDictionaryIndex ofObject: _gsSqueakTemp_currClass.
	_gsSqueakTemp_classDictSize := objectMemory numSlotsOf: _gsSqueakTemp_classDict.
	_gsSqueakTemp_classDictSize > MethodArrayIndex
		ifTrue: [_gsSqueakTemp_methodArray := objectMemory fetchPointer: MethodArrayIndex ofObject: _gsSqueakTemp_classDict.
			_gsSqueakTemp_i := 0.
			[_gsSqueakTemp_i <= (_gsSqueakTemp_classDictSize - SelectorStart)]
				whileTrue: [meth
							= (objectMemory fetchPointer: _gsSqueakTemp_i ofObject: _gsSqueakTemp_methodArray)
						ifTrue: [^ binaryBlock
								value: (objectMemory fetchPointer: _gsSqueakTemp_i + SelectorStart ofObject: _gsSqueakTemp_classDict)
								value: _gsSqueakTemp_currClass].
					_gsSqueakTemp_i := _gsSqueakTemp_i + 1]].
	_gsSqueakTemp_currClass := self superclassOf: _gsSqueakTemp_currClass.
	_gsSqueakTemp_currClass = objectMemory nilObject] whileFalse.
	^ binaryBlock
		value: (objectMemory splObj: SelectorDoesNotUnderstand)
		value: nil"method not found in superclass chain"