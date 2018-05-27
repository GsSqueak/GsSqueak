evaluating
evaluateExpression: aText

	^ self environment
		evaluate: aText asString
		inContext: nil