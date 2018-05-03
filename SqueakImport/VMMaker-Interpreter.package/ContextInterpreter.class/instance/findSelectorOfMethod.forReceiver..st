debug support
findSelectorOfMethod: meth forReceiver: rcvr

	| currClass done classDict classDictSize methodArray i |
	currClass := objectMemory fetchClassOf: rcvr.
	done := false.
	[done] whileFalse: [
		classDict := objectMemory fetchPointer: MessageDictionaryIndex ofObject: currClass.
		classDictSize := objectMemory fetchWordLengthOf: classDict.
		methodArray := objectMemory fetchPointer: MethodArrayIndex ofObject: classDict.
		i := 0.
		[i <= (classDictSize - SelectorStart)] whileTrue: [
			meth = (objectMemory fetchPointer: i ofObject: methodArray) ifTrue: [
				^(objectMemory fetchPointer: i + SelectorStart ofObject: classDict)
			].
			i := i + 1.
		].
		currClass := objectMemory fetchPointer: SuperclassIndex ofObject: currClass.
		done := currClass = objectMemory getNilObj.
	].
	^ objectMemory getNilObj    "method not found in superclass chain"