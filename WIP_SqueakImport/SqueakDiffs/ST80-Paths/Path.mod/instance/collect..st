enumerating
collect: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect the resulting values into a path that is like the receiver. Answer 
	the new path."

	| newCollection |
	newCollection := collectionOfPoints collect: aBlock.
	newCollection form: self form.
	^newCollection