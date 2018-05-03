quick primitives - context interpreter
primitivePushNil
	self popStack.
	self push: objectMemory getNilObj