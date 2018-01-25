apply primitives
tryNamedPrimitive
	"This method is a template that the Smalltalk simulator uses to 
	execute primitives. See Object documentation whatIsAPrimitive."
	<primitive:'' module:'' error: errorCode>
	^ContextPart primitiveFailTokenFor: errorCode