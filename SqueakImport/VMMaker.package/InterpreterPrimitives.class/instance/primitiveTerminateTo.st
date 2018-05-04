process primitives
primitiveTerminateTo
	"Primitive. Terminate up the context stack from the receiver up to but not including the argument, if previousContext is on my Context stack. Make previousContext my sender. This prim has to shadow the code in ContextPart>terminateTo: to be correct"

	self subclassResponsibility