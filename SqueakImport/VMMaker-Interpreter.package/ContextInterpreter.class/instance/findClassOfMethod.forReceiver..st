debug support
findClassOfMethod: meth forReceiver: rcvr

	| currClass classDict classDictSize methodArray i done |
	currClass := objectMemory fetchClassOf: rcvr.
	done := false.
	[done] whileFalse: [
		classDict := objectMemory fetchPointer: MessageDictionaryIndex ofObject: currClass.
		classDictSize := objectMemory fetchWordLengthOf: classDict.
		methodArray := objectMemory fetchPointer: MethodArrayIndex ofObject: classDict.
		i := 0.
		[i < (classDictSize - SelectorStart)] whileTrue: [
			meth = (objectMemory fetchPointer: i ofObject: methodArray) ifTrue: [ ^currClass ].
			i := i + 1.
		].
		currClass := objectMemory fetchPointer: SuperclassIndex ofObject: currClass.
		done := currClass = objectMemory getNilObj.
	].
	^objectMemory fetchClassOf: rcvr    "method not found in superclass chain"