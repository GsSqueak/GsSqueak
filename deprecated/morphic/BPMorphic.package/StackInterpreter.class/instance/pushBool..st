internal interpreter access
pushBool: trueOrFalse 
	self
		push: (objectMemory booleanObjectOf: trueOrFalse)