C code generation
emitCCodeAsFunctionCallOn: aStream level: level generator: aCodeGen

	"Translate this message send into a C function call"
	"Special case for pluggable modules. Replace messages to interpreterProxy
	 by interpreterProxy->message(..) if the message is not builtin"
	| fn fnargtypes |
	(aCodeGen isGeneratingPluginCode
	 and: [receiver isVariable
	 and: ['interpreterProxy' = receiver name
	 and: [self isBuiltinOperator not]]]) ifTrue:
		[aStream nextPutAll:'interpreterProxy->'].
	"Translate this message send into a C function call."
	aStream nextPutAll: (aCodeGen cFunctionNameFor: selector); nextPut: $(.
	"Only include the receiver as the first argument in certain cases.
	 The receiver is always included if it is an expression.
	 If it is a variable:
		 If the vmClass says it is an implicit variable, don't include it.
		 If the variable is 'self' and the method being called is not in
		 the method set (i.e. it is some external code), don't include it."
	(self shouldIncludeReceiverAsFirstArgument: aCodeGen) ifTrue:
		[receiver emitCCodeOn: aStream level: level generator: aCodeGen.
		arguments isEmpty ifFalse:
			[aStream nextPutAll: ', ']].
	fn := aCodeGen methodNamed: self selector.
	fn notNil ifTrue: [ fnargtypes := fn argTypes ].
	fnargtypes notNil ifTrue: [ fnargtypes size = arguments size ifFalse: [ fnargtypes := nil ] ].
	fnargtypes notNil ifTrue: [ fnargtypes := fnargtypes collect: [ :a | aCodeGen declToType: a ]].
	arguments withIndexDo:
		[ :arg :i | | argtype fnargtype |
		i = 1 ifFalse: [aStream nextPut: $,; space].
		argtype := nil.
		fnargtype := nil.
		(arg name notNil) ifTrue: [ argtype := aCodeGen declToType: (aCodeGen typeOfVariable: arg name) ].
		fnargtypes notNil ifTrue: [ fnargtype := fnargtypes at: i ].
		"Insert cast of function argument type if necessary"
		(argtype notNil and: fnargtype notNil and: [ argtype ~= fnargtype ]) ifTrue: [ aStream nextPutAll: '(',fnargtype,')'  ]. 
		arg emitCCodeAsArgumentOn: aStream level: level generator: aCodeGen].
	aStream nextPut: $)