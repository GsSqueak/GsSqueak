*SqNumbers-arithmetic
* aNumber 
	"Primitive. Answer the result of multiplying the receiver by aNumber.
	Fail if the argument is not a Float. Essential. See Object documentation
	whatIsAPrimitive."

	<primitive: 102> "Gemstone primitive"
	^ aNumber adaptToFloat: self andSend: #*
