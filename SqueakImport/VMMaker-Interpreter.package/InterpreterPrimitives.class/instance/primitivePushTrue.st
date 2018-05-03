quick primitives - context interpreter
primitivePushTrue
	self popStack.
	self push: objectMemory getTrueObj