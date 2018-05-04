C code generation
emitCCodeOn: aStream level: level generator: aCodeGen
	expression isSwitch ifTrue:
		[^expression emitCCodeOn: aStream addToEndOfCases: self level: level generator: aCodeGen].
	variable emitCCodeOn: aStream level: level generator: aCodeGen.
	self isVariableUpdatingAssignment
		ifTrue:
			[aStream
				space;
				nextPutAll: expression selector;	"+ or -"
				nextPut: $=;
				space.
			expression args first emitCCodeAsArgumentOn: aStream level: level generator: aCodeGen]
		ifFalse:
			[| vartype |
			 aStream space; nextPut: $=; space.
			 "Add an appropriate cast if we need to do so"
			 vartype := aCodeGen typeOfVariable: variable name.
			 vartype := aCodeGen declToType: vartype.
			 ((expression isMemberOf: TSendNode) and: [vartype ~= nil])
				ifTrue:
					[| fntype expselector |
					 vartype := vartype asSymbol.
					 expselector := expression selector.
					 fntype := (aCodeGen methodNamed: expselector).
					 fntype notNil ifTrue: [ fntype := fntype returnType ].
					 "The expression may have been inlined"
					 fntype isNil ifTrue: [ fntype := aCodeGen inlineReturnType: expselector ].
					 (fntype notNil and: [ fntype ~= vartype ] and: [ vartype ~= #void ]) ifTrue:
						[aStream nextPut: $(; nextPutAll: vartype asString; nextPut: $)].
					].
			 expression emitCCodeAsArgumentOn: aStream level: level generator: aCodeGen]