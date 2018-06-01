public access
compileNoPattern: textOrStream in: aClass notifying: aRequestor ifFail: failBlock
	"Similar to #compile:in:notifying:ifFail:, but the compiled code is
	expected to be a do-it expression, with no message pattern."

	^self
		compileCue: (CompilationCue
			source: textOrStream
			class: aClass
			requestor: aRequestor)
		noPattern: true
		ifFail: failBlock
