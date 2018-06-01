enumerating
select: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new path like the receiver only those elements for which 
	aBlock evaluates to true. Answer the new path."

	| newCollection |
	newCollection := collectionOfPoints select: aBlock.
	newCollection form: self form.
	^newCollection