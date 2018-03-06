code generation
constructClosureCreationNode: encoder 
	copiedValues := self computeCopiedValues: encoder rootNode.
	^ self ensureClosureCreationNode