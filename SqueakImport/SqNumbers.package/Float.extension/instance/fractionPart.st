*SqNumbers-truncation and round off
fractionPart
	"Primitive. Answer a Float whose value is the difference between the 
	receiver and the receiver's asInteger value. Optional. See Object 
	documentation whatIsAPrimitive."

	^ self - self truncated asFloat
