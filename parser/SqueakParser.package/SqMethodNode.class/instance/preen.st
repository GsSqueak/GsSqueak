converting
preen
	"Preen for pretty-printing and/or decompilation.
	i.e. post-process to cover up for inadequacies in both algorithms.
	
	Currently two cases:
	
	preenLocalIfNotNilArg: blockNode
	hiding the assignment to the arg of an inlined block arg to ifNotNil:,
	(var := expr) ifNil: [...] ifNotNil: [...] => expr ifNil: [...] ifNotNil: [:var|
	...]. 
	preenTempsConflictingWithBlockNode: temps
	hiding the declaration of a temp that is redeclared in some block"
	self preenableNodes
		keysAndValuesDo: [:nodeOrArray :selector | self perform: selector with: nodeOrArray]