*SqClasses-system primitives
becomeForward: otherObject copyHash: copyHash
	"Primitive. All variables in the entire system that used to point to
	 the receiver now point to the argument. If copyHash is true, the
	 argument's identity hash bits will be set to those of the receiver.
	 Fails if either argument is an immediate such as a SmallInteger."

	{self}
		elementsForwardIdentityTo: {otherObject}
		copyHash: copyHash
