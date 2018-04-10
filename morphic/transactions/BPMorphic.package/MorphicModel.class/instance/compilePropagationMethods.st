compilation
compilePropagationMethods
	(self class organization listAtCategoryNamed: 'private - propagation' asSymbol)
		do: [:sel | 
			| varName |
			varName := sel allButLast.
			model class compilePropagationForVarName: varName slotName: slotName]