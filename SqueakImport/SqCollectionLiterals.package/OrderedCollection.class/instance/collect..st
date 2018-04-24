enumerating
collect: aBlock 
	"Evaluate aBlock with each of my elements as the argument.
	Collect the resulting values into an OrderedCollection."

	| newCollection |
	newCollection := OrderedCollection new: self size.
	firstIndex to: lastIndex do:
		[:index |
		newCollection addLast: (aBlock value: (array at: index))].
	^ newCollection