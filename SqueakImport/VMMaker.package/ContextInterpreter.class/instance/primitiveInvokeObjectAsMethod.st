control primitives
primitiveInvokeObjectAsMethod
	"Primitive. 'Invoke' an object like a function, sending the special message 
		run: originalSelector with: arguments in: aReceiver.
	"
	| runSelector runReceiver runArgs newReceiver lookupClass |
	runArgs := objectMemory instantiateClass: (objectMemory splObj: ClassArray) indexableSize: argumentCount.
	objectMemory beRootIfOld: runArgs. "do we really need this?"
	self transfer: argumentCount from: stackPointer - ((argumentCount - 1) * objectMemory bytesPerWord) to: runArgs + objectMemory baseHeaderSize.

	runSelector := messageSelector.
	runReceiver := self stackValue: argumentCount.
	self pop: argumentCount+1.

	"stack is clean here"

	newReceiver := newMethod.
	messageSelector := objectMemory splObj: SelectorRunWithIn.
	argumentCount := 3.

	self push: newReceiver.
	self push: runSelector.
	self push: runArgs.
	self push: runReceiver.

	lookupClass := objectMemory fetchClassOf: newReceiver.
	self findNewMethodInClass: lookupClass.
	self executeNewMethodFromCache.  "Recursive xeq affects primFailCode"
	self initPrimCall.
