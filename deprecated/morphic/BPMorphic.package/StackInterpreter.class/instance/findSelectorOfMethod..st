debug support
findSelectorOfMethod: meth 
	| _gsSqueakTemp_classObj _gsSqueakTemp_classDict _gsSqueakTemp_classDictSize _gsSqueakTemp_methodArray _gsSqueakTemp_i |
	(objectMemory addressCouldBeObj: meth)
		ifFalse: [^ objectMemory nilObject].
	(objectMemory isForwarded: meth)
		ifTrue: [^ self
				findSelectorOfMethod: (objectMemory followForwarded: meth)].
	(objectMemory isOopCompiledMethod: meth)
		ifFalse: [^ objectMemory nilObject].
	(self maybeSelectorOfMethod: meth)
		ifNotNil: [:selector | ^ selector].
	_gsSqueakTemp_classObj := self safeMethodClassOf: meth.
	(self addressCouldBeClassObj: _gsSqueakTemp_classObj)
		ifTrue: [_gsSqueakTemp_classDict := objectMemory fetchPointer: MethodDictionaryIndex ofObject: _gsSqueakTemp_classObj.
			_gsSqueakTemp_classDictSize := objectMemory numSlotsOf: _gsSqueakTemp_classDict.
			_gsSqueakTemp_classDictSize > MethodArrayIndex
				ifTrue: [_gsSqueakTemp_methodArray := objectMemory fetchPointer: MethodArrayIndex ofObject: _gsSqueakTemp_classDict.
					_gsSqueakTemp_i := 0.
					[_gsSqueakTemp_i < (_gsSqueakTemp_classDictSize - SelectorStart)]
						whileTrue: [meth
									= (objectMemory fetchPointer: _gsSqueakTemp_i ofObject: _gsSqueakTemp_methodArray)
								ifTrue: [^ objectMemory fetchPointer: _gsSqueakTemp_i + SelectorStart ofObject: _gsSqueakTemp_classDict].
							_gsSqueakTemp_i := _gsSqueakTemp_i + 1]]].
	^ objectMemory nilObject