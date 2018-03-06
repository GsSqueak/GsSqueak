visiting
argumentsInEvaluationOrder
	"Answer the receivers arguments in evaluation order.
	If the receiver is a transformed to:do: node this will undo the
	misordering done by the transformation."
	^ (special > 0
			and: [(MacroTransformers at: special)
						== #transformToDo:
					and: [arguments size >= 7]])
		ifTrue: ["arguments are in a weid order and may be nil in a
			transformed to:do: loop. sigh...
			c.f. emitCodeForToDo:encoder:value:"
			(arguments at: 7)
				ifNil: ["limitInit"
					{arguments at: 4. arguments at: 5. arguments at: 3. arguments at: 6}
					"initStmt"
					"test"
					"block"
					"incStmt"]
				ifNotNil: [:limitInit | {limitInit. arguments at: 4. arguments at: 5. arguments at: 3. arguments at: 6}
					"initStmt"
					"test"
					"block"
					"incStmt"]]
		ifFalse: [arguments]