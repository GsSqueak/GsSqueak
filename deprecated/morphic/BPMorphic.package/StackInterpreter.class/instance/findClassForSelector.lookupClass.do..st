debug support
findClassForSelector: aSelector lookupClass: startClass do: unaryBlock 
	"Search startClass' class hierarchy looking for aSelector and if found,
	evaluate unaryBlock
	with the class where the selector is found. Otherwise evaluate
	unaryBlock with nil."
	| _gsSqueakTemp_currClass _gsSqueakTemp_classDict _gsSqueakTemp_classDictSize _gsSqueakTemp_i |
	_gsSqueakTemp_currClass := startClass.
	[_gsSqueakTemp_classDict := objectMemory fetchPointer: MethodDictionaryIndex ofObject: _gsSqueakTemp_currClass.
	_gsSqueakTemp_classDictSize := objectMemory numSlotsOf: _gsSqueakTemp_classDict.
	_gsSqueakTemp_i := SelectorStart.
	[_gsSqueakTemp_i < _gsSqueakTemp_classDictSize]
		whileTrue: [aSelector
					= (objectMemory fetchPointer: _gsSqueakTemp_i ofObject: _gsSqueakTemp_classDict)
				ifTrue: [^ unaryBlock value: _gsSqueakTemp_currClass].
			_gsSqueakTemp_i := _gsSqueakTemp_i + 1].
	_gsSqueakTemp_currClass := self superclassOf: _gsSqueakTemp_currClass.
	_gsSqueakTemp_currClass = objectMemory nilObject] whileFalse.
	^ unaryBlock value: nil"selector not found in superclass chain"