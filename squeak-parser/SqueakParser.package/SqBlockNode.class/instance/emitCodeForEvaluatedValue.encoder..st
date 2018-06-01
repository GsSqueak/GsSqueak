code generation
emitCodeForEvaluatedValue: stack encoder: encoder 
	| position |
	position := stack position.
	self emitCodeExceptLast: stack encoder: encoder.
	statements last emitCodeForBlockValue: stack encoder: encoder.
	self assert: stack position - 1 = position