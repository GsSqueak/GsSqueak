quick primitives - context interpreter
primitivePushFalse
	self popStack.
	self push: objectMemory getFalseObj