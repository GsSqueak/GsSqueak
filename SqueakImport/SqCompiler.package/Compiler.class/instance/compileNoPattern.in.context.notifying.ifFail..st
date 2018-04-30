public access
compileNoPattern: textOrStream in: aClass context: aContext notifying: aRequestor ifFail: failBlock
	"Similar to #compile:in:notifying:ifFail:, but the compiled code is
	expected to be a do-it expression, with no message pattern."

	^self
		compileCue: (CompilationCue
			source: textOrStream
			context: aContext
			class: aClass
			requestor: aRequestor)
		noPattern: true
		ifFail: failBlock
