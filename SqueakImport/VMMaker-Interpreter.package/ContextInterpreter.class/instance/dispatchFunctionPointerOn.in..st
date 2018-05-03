message sending
dispatchFunctionPointerOn: primIdx in: primTable
	"Call the primitive at index primIdx in the primitiveTable."

	<var: #primTable declareC: 'void (*primTable[])(void)'>
	^self dispatchFunctionPointer: (primTable at: primIdx)