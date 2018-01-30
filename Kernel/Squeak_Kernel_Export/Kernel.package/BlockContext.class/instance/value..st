evaluating
value: arg 
	"Primitive. Evaluate the block represented by the receiver. Fail if the 
	block expects other than one argument or if the block is already being 
	executed. Optional. No Lookup. See Object documentation 
	whatIsAPrimitive."

	<primitive: 81>
	^self valueWithArguments: (Array with: arg)