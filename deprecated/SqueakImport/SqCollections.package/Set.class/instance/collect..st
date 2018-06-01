enumerating
collect: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."

	| newSet |
	newSet := Set new: self size.
	self do: [ :each | newSet add: (aBlock value: each) ].
	^newSet