control primitives
primitiveInvokeObjectAsMethod
	"Primitive. 'Invoke' an object like a function, sending the special message 
		run: originalSelector with: arguments in: aReceiver.
	"
	self subclassResponsibility