*SqCollectionLiterals-accessing
at: index 
	"Primitive. Answer the Character stored in the field of the receiver
	indexed by the argument. Fail if the index argument is not an Integer or
	is out of bounds. Essential. See Object documentation whatIsAPrimitive."

	^ Character value: (super at: index)
