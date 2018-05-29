evaluating
evaluateExpression: aText

	self flag: #gsg. "CodeTool doesn't understand envId."
	^ self environment
		evaluate: aText asString
		inContext: nil