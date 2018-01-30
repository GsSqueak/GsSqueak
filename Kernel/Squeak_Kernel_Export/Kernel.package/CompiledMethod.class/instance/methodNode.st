decompiling
methodNode
	"Return the parse tree that represents self. If parsing fails, decompile the method."
	| aClass source |
	aClass := self methodClass.
	source := self
				getSourceFor: (self selector ifNil: [self defaultSelector])
				in: aClass.
	^[(aClass newParser
		encoderClass: self encoderClass;
		parse: source class: aClass)
			sourceText: source;
			yourself]
		on: SyntaxErrorNotification
		do: [:ex | ex return: self decompileWithTemps]