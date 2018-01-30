arithmetic
/ aNumber 
	"Primitive. Answer the result of dividing receiver by aNumber.
	Fail if the argument is not a Float. Essential. See Object documentation
	whatIsAPrimitive."

	<primitive: 50>
	aNumber isZero ifTrue: [^(ZeroDivide dividend: self) signal].
	^ aNumber adaptToFloat: self andSend: #/