plugin primitive support
callExternalPrimitive: functionID
	"Call the external plugin function identified. In the VM this is an address, see 	InterpreterSimulator for it's version. "

	<var: #functionID declareC: 'void (*functionID)(void)'>
	self dispatchFunctionPointer: functionID