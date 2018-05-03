quick primitives - context interpreter
primitivePushSelf
"	no-op, really...
	thisReceiver := self popStack.
	self push: thisReceiver
"