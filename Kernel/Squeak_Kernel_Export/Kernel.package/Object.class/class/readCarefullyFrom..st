instance creation
readCarefullyFrom: textStringOrStream
	"Create an object based on the contents of textStringOrStream.  Return an error instead of putting up a SyntaxError window."

	| object |
	(Compiler couldEvaluate: textStringOrStream)
		ifFalse: [^ self error: 'expected String, Stream, or Text'].
	object := Compiler evaluate: textStringOrStream for: nil 
				notifying: #error: "signal we want errors".
	(object isKindOf: self) ifFalse: [self error: self name, ' expected'].
	^object