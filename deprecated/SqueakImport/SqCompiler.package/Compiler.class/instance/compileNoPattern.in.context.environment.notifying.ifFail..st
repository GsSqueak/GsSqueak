public access
compileNoPattern: textOrStream in: aClass context: aContext environment: anEnvironment notifying: aRequestor ifFail: failBlock
	"Similar to #compile:in:notifying:ifFail:, but the compiled code is
	expected to be a do-it expression, with no message pattern,
	and it will be in an explicit environment."

	^self
		compileCue: (CompilationCue
			source: textOrStream
			context: aContext
			class: aClass
			environment: anEnvironment
			requestor: aRequestor)
		noPattern: true
		ifFail: failBlock
