*SqClasses-accessing
at: index 
	"Primitive. Assumes receiver is indexable. Answer the value of an 
	indexable element in the receiver. Fail if the argument index is not an 
	Integer or is out of bounds. Essential. See Object documentation 
	whatIsAPrimitive."

	self class isWords ifTrue: [^ self primWordBasicAt: index].
	^ self primNormalBasicAt: index
