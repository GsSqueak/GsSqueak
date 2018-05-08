private - interpreter
evalTailObject: form 
	^ self evalObject: form multipleValue: true.
	
