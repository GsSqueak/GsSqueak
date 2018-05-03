debug support
printStackTemps: ctxt onStream: strm
	| home cMethod nArgs nTemps oop |
	home := (objectMemory fetchClassOf: ctxt) = (objectMemory splObj: ClassBlockContext)
		ifTrue: [objectMemory fetchPointer: HomeIndex ofObject: ctxt]
		ifFalse: [ctxt].
	cMethod := objectMemory fetchPointer: MethodIndex ofObject: home.
	nArgs := nTemps := 0.

	home = ctxt ifTrue:
		[strm cr; tab; nextPutAll: 'args: '.
		nArgs := self argumentCountOf: cMethod.
		1 to: nArgs do:
			[:i | oop := objectMemory fetchPointer: TempFrameStart + i-1 ofObject: ctxt.
			strm nextPutAll: oop hex; space].

		strm cr; tab; nextPutAll: 'temps: '.
		nTemps := self tempCountOf: cMethod.
		nArgs+1 to: nTemps do:
			[:i | oop := objectMemory fetchPointer: TempFrameStart + i-1 ofObject: ctxt.
			strm nextPutAll: oop hex; space]].
	
	strm cr; tab; nextPutAll: 'stack: '.
	nTemps + 1 to: (objectMemory lastPointerOf: ctxt)//bytesPerWord - TempFrameStart do:
		[:i | oop := objectMemory fetchPointer: TempFrameStart + i-1 ofObject: ctxt.
			strm nextPutAll: oop hex; space].
	