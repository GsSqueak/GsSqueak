*SqClasses-accessing
basicAt: index 
	"Primitive. Assumes receiver is indexable. Answer the value of an 
	indexable element in the receiver. Fail if the argument index is not an 
	Integer or is out of bounds. Essential. Do not override in a subclass. See 
	Object documentation whatIsAPrimitive."

	self class isWords ifTrue: [^ self primWordBasicAt: index].
	^ self primNormalBasicAt: index
