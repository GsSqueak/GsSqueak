macro transformations
transformToDo: encoder 
	"var := rcvr. L1: [var <= arg1] Bfp(L2) [block body. var := var + inc]
	Jmp(L1) L2:"
	| limit increment block initStmt test incStmt limitInit blockVar myRange blockRange |
	block := arguments last.
	"First check for valid arguments"
	(block notNil
			and: [block isBlockNode
					and: [block numberOfArguments = 1
							and: [block firstArgument isVariableReference
								"As with debugger remote vars"]]])
		ifFalse: [^ false].
	arguments size = 3
		ifTrue: [increment := arguments at: 2.
			(increment isConstantNumber
					and: [increment literalValue ~= 0])
				ifFalse: [^ false]]
		ifFalse: [increment := encoder encodeLiteral: 1].
	(limit := arguments at: 1) isVariableReference
		ifTrue: [| shouldScanForAssignment |
			shouldScanForAssignment := limit isArg not
						or: [limit isBlockArg
								and: [SqScanner allowBlockArgumentAssignment]].
			shouldScanForAssignment
				ifTrue: [block
						nodesDo: [:node | (node isAssignmentNode
									and: [node variable = limit])
								ifTrue: [^ false]]]].
	arguments size < 3
		ifTrue: ["transform to full form"
			selector := SqSelectorNode new key: #to:by:do: code: #macro].
	"Now generate auxiliary structures"
	myRange := encoder rawSourceRanges
				at: self
				ifAbsent: [1 to: 0].
	blockRange := encoder rawSourceRanges
				at: block
				ifAbsent: [1 to: 0].
	blockVar := block firstArgument.
	initStmt := SqAssignmentNode new variable: blockVar value: receiver.
	(limit isVariableReference
			or: [limit isConstantNumber])
		ifTrue: [limitInit := nil]
		ifFalse: ["Need to store limit in a var"
			limit := encoder bindBlockArg: blockVar key , 'LimiT' within: block.
			limit scope: -2.
			"Already done parsing block; flag so it won't print"
			block addArgument: limit.
			limitInit := SqAssignmentNode new variable: limit value: arguments first].
	test := SqMessageNode new
				receiver: blockVar
				selector: (increment key > 0
						ifTrue: [#<=]
						ifFalse: [#>=])
				arguments: {limit}
				precedence: precedence
				from: encoder
				sourceRange: (myRange first to: blockRange first).
	incStmt := SqAssignmentNode new
				variable: blockVar
				value: (SqMessageNode new
						receiver: blockVar
						selector: #+
						arguments: {increment}
						precedence: precedence
						from: encoder
						sourceRange: (myRange last
								to: (myRange last max: blockRange last)))
				from: encoder
				sourceRange: (myRange last
						to: (myRange last max: blockRange last)).
	arguments := {limit. increment. block. initStmt. test. incStmt. limitInit}.
	block noteOptimizedIn: self.
	^ true