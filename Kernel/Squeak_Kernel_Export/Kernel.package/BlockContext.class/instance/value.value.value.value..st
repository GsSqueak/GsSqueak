evaluating
value: arg1 value: arg2 value: arg3 value: arg4 
	"Primitive. Evaluate the block represented by the receiver. Fail if the 
	block expects other than three arguments or if the block is already being 
	executed. Optional. See Object documentation whatIsAPrimitive."

	<primitive: 81>
	^self valueWithArguments: 
		(Array
			with: arg1
			with: arg2
			with: arg3
			with: arg4)