debug support
findClassContainingMethod: meth startingAt: classObj 
	| _gsSqueakTemp_currClass _gsSqueakTemp_classDict _gsSqueakTemp_classDictSize _gsSqueakTemp_methodArray _gsSqueakTemp_i |
	(objectMemory isOopForwarded: classObj)
		ifTrue: [_gsSqueakTemp_currClass := objectMemory followForwarded: classObj]
		ifFalse: [_gsSqueakTemp_currClass := classObj].
	[self assert: (objectMemory isForwarded: _gsSqueakTemp_currClass) not.
	(self addressCouldBeClassObj: _gsSqueakTemp_currClass)
		ifFalse: [^ objectMemory nilObject].
	_gsSqueakTemp_classDict := objectMemory noFixupFollowField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currClass.
	self assert: (objectMemory isForwarded: _gsSqueakTemp_classDict) not.
	_gsSqueakTemp_classDictSize := objectMemory numSlotsOf: _gsSqueakTemp_classDict.
	_gsSqueakTemp_classDictSize > MethodArrayIndex
		ifTrue: [_gsSqueakTemp_methodArray := objectMemory noFixupFollowField: MethodArrayIndex ofObject: _gsSqueakTemp_classDict.
			self assert: (objectMemory isForwarded: _gsSqueakTemp_methodArray) not.
			_gsSqueakTemp_i := 0.
			[_gsSqueakTemp_i < (_gsSqueakTemp_classDictSize - SelectorStart)]
				whileTrue: [meth
							= (objectMemory noFixupFollowField: _gsSqueakTemp_i ofObject: _gsSqueakTemp_methodArray)
						ifTrue: [^ _gsSqueakTemp_currClass"method not found in superclass chain"].
					_gsSqueakTemp_i := _gsSqueakTemp_i + 1]].
	_gsSqueakTemp_currClass := self noFixupSuperclassOf: _gsSqueakTemp_currClass.
	_gsSqueakTemp_currClass = objectMemory nilObject] whileFalse.
	^ _gsSqueakTemp_currClass"method not found in superclass chain"