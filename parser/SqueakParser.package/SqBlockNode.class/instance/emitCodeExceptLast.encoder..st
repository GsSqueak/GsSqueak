code generation
emitCodeExceptLast: stack encoder: encoder 
	| position nextToLast |
	position := stack position.
	nextToLast := statements size - 1.
	1
		to: nextToLast
		do: [:i | 
			| statement |
			statement := statements at: i.
			statement emitCodeForEffect: stack encoder: encoder.
			self assert: stack position = position]