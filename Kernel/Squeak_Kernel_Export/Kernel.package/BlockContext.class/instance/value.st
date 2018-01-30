evaluating
value
	"Primitive. Evaluate the block represented by the receiver. Fail if the 
	block expects any arguments or if the block is already being executed. 
	Optional. No Lookup. See Object documentation whatIsAPrimitive."

	<primitive: 81>
	^self valueWithArguments: #()