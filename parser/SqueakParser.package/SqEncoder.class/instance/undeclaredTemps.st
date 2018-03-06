results
undeclaredTemps
	^ (scopeTable
		select: [:var | var isVariableNode
				and: [var isUndeclared]]) values