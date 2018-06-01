public access logging
evaluate: textOrStream in: aContext to: receiver environment: anEnvironment notifying: aRequestor ifFail: failBlock logged: logFlag
	"Same as #evaluate:in:to:notifying:ifFail:logged: but with an explicit environment"
	^self
		evaluateCue: (CompilationCue
			source: textOrStream
			context: aContext
			receiver: receiver
			class: (self classForReceiver: receiver context: aContext)
			environment: anEnvironment
			requestor: aRequestor)
		ifFail: failBlock
		logged: logFlag