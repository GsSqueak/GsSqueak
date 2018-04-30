public access logging
compiledMethodFor: textOrStream in: aContext to: receiver notifying: aRequestor ifFail: failBlock logged: logFlag
	"Compiles the sourceStream into a parse tree, then generates code
	 into a method, and answers it.  If receiver is not nil, then the text can
	 refer to instance variables of that receiver (the Inspector uses this).
	 If aContext is not nil, the text can refer to temporaries in that context
	 (the Debugger uses this). If aRequestor is not nil, then it will receive a 
	 notify:at: message before the attempt to evaluate is aborted."

	| method |
	method := self
		compiledMethodFor: textOrStream
		in: aContext
		to: receiver
		notifying: aRequestor
		ifFail: [^failBlock value].
	logFlag ifTrue:
		[SystemChangeNotifier uniqueInstance evaluated: cue stringToLog context: aContext].
	^method