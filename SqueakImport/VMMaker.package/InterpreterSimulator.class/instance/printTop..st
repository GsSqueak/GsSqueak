debug support
printTop: n
	"Print important fields of the top n contexts"
	| ctxt classAndSel home top ip sp |
	ctxt := activeContext.
	^ String streamContents:
		[:strm | 1 to: n do:
			[:i |
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
			ctxt = activeContext
				ifTrue: [ip := instructionPointer - method - (objectMemory baseHeaderSize - 2).
						sp := self stackPointerIndex - TempFrameStart + 1.
						top := self stackTop]
				ifFalse: [ip := objectMemory integerValueOf:
							(objectMemory fetchPointer: InstructionPointerIndex ofObject: ctxt).
						sp := objectMemory integerValueOf:
							(objectMemory fetchPointer: StackPointerIndex ofObject: ctxt).
						top := objectMemory longAt: ctxt + (objectMemory lastPointerOf: ctxt)].
			strm cr; tab; nextPutAll: 'ip = '; print: ip.
			strm cr; tab; nextPutAll: 'sp = '; print: sp.
			strm cr; tab; nextPutAll: 'top = '; nextPutAll: (self shortPrint: top).
			(ctxt := (objectMemory fetchPointer: SenderIndex ofObject: ctxt)) = objectMemory getNilObj
				ifTrue: [^strm contents].
			].
		]