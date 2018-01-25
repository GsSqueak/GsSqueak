decompiling
parserClass
	^self methodClass 
		ifNil: [Compiler parserClass] 
		ifNotNil: [:class | class parserClass].