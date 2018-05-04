debug printing
printCallStackOf: aContext

	| ctxt home methClass methodSel message |
	<inline: false>
	ctxt := aContext.
	[ctxt = objectMemory getNilObj] whileFalse: [
		(objectMemory fetchClassOf: ctxt) = (objectMemory splObj: ClassBlockContext)
			ifTrue: [ home := objectMemory fetchPointer: HomeIndex ofObject: ctxt ]
			ifFalse: [ home := ctxt ].
		methClass :=
			self findClassOfMethod: (objectMemory fetchPointer: MethodIndex ofObject: home)
					   forReceiver: (objectMemory fetchPointer: ReceiverIndex ofObject: home).
		methodSel :=
			self findSelectorOfMethod: (objectMemory fetchPointer: MethodIndex ofObject: home)
						 forReceiver: (objectMemory fetchPointer: ReceiverIndex ofObject: home).
		self printNum: ctxt.
		self print: ' '.
		ctxt = home ifFalse: [ self print: '[] in ' ].
		self printNameOfClass: methClass count: 5.
		self print: '>'.
		methodSel = objectMemory getNilObj
			ifTrue: [self print: '?']
			ifFalse: [self printStringOf: methodSel].
		methodSel = (objectMemory splObj: SelectorDoesNotUnderstand) ifTrue: [
			"print arg message selector"
			message := objectMemory fetchPointer: 0 + TempFrameStart ofObject: home.
			methodSel := objectMemory fetchPointer: MessageSelectorIndex ofObject: message.
			self print: ' '.
			self printStringOf: methodSel.
		].
		self cr.

		ctxt := (objectMemory fetchPointer: SenderIndex ofObject: ctxt).
	].