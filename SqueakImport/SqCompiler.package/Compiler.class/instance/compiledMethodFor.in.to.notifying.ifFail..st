public access
compiledMethodFor: textOrStream in: aContext to: receiver notifying: aRequestor ifFail: failBlock
	"Compiles the sourceStream into a parse tree, then generates code
	 into a method, and answers it.  If receiver is not nil, then the text can
	 refer to instance variables of that receiver (the Inspector uses this).
	 If aContext is not nil, the text can refer to temporaries in that context
	 (the Debugger uses this). If aRequestor is not nil, then it will receive a 
	 notify:at: message before the attempt to evaluate is aborted."

	| methodNode method |
	methodNode := self
		compileNoPattern: textOrStream
		in: (self classForReceiver: receiver context: aContext)
		context: aContext
		notifying: aRequestor
		ifFail: [^failBlock value].
	method := self interactive
		ifTrue: [ methodNode generateWithTempNames ] 
		ifFalse: [ methodNode generate ].
	^method