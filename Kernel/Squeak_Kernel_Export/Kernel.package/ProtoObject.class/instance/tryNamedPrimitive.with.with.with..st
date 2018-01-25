apply primitives
tryNamedPrimitive: arg1 with: arg2 with: arg3 with: arg4
	"This method is a template that the Smalltalk simulator uses to 
	execute primitives. See Object documentation whatIsAPrimitive."
	<primitive:'' module:'' error: errorCode>
	^ContextPart primitiveFailTokenFor: errorCode