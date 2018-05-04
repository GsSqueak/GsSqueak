debug support
printStackFrame: ctxt onStream: strm
	| classAndSel home |
	home := (objectMemory fetchClassOf: ctxt) = (objectMemory splObj: ClassBlockContext)
		ifTrue: [objectMemory fetchPointer: HomeIndex ofObject: ctxt]
		ifFalse: [ctxt].
	classAndSel := self
		classAndSelectorOfMethod: (objectMemory fetchPointer: MethodIndex ofObject: home)
		forReceiver: (objectMemory fetchPointer: ReceiverIndex ofObject: home).
	strm cr; nextPutAll: ctxt hex8.
	ctxt = home ifFalse: [strm nextPutAll: ' [] in'].
	strm space; nextPutAll: (self nameOfClass: classAndSel first).
	strm nextPutAll: '>>'; nextPutAll: (self shortPrint: classAndSel last).
