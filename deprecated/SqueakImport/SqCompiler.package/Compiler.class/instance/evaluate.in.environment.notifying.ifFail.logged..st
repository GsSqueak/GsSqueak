public access logging
evaluate: textOrStream in: aContext environment: anEnvironment notifying: aRequestor ifFail: failBlock logged: logFlag
	"Compiles the sourceStream into a parse tree, then generates code into
	 a method. If aContext is not nil, the text can refer to temporaries in that
	 context (the Debugger uses this). If aRequestor is not nil, then it will receive
	 a notify:at: message before the attempt to evaluate is aborted. Finally, the 
	 compiled method is invoked from here via withArgs:executeMethod:, hence
	 the system no longer creates Doit method litter on errors."
	^self
		evaluateCue: (CompilationCue
			source: textOrStream
			context: aContext
			receiver: nil
			class: UndefinedObject
			environment: anEnvironment
			requestor: aRequestor)
		ifFail: failBlock
		logged: logFlag