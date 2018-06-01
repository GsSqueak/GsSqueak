debug support
findSelectorOfMethod: meth forReceiver: rcvr

	| currClass classDict classDictSize methodArray i |
	currClass := objectMemory fetchClassOf: rcvr.
	[classDict := objectMemory fetchPointer: MethodDictionaryIndex ofObject: currClass.
	 classDictSize := objectMemory fetchWordLengthOf: classDict.
	 methodArray := objectMemory fetchPointer: MethodArrayIndex ofObject: classDict.
	 i := 0.
	 [i <= (classDictSize - SelectorStart)] whileTrue:
		[meth = (objectMemory fetchPointer: i ofObject: methodArray) ifTrue:
			[^(objectMemory fetchPointer: i + SelectorStart ofObject: classDict)].
			i := i + 1].
	 currClass := self superclassOf: currClass.
	 currClass = objectMemory nilObject] whileFalse.
	^currClass    "method not found in superclass chain"