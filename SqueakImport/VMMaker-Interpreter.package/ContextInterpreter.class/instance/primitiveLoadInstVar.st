quick primitives
primitiveLoadInstVar
	| thisReceiver |
	thisReceiver := self popStack.
	self push: (objectMemory fetchPointer: primitiveIndex-264 ofObject: thisReceiver)