enumerating
collect: aBlock from: fromIndex to: toIndex
	"Evaluate aBlock with each of my elements as the argument between fromIndex and toIndex.
	Collect the resulting values into an OrderedCollection."

	| result offset |
	offset := firstIndex - 1.
	(fromIndex < 1 or:[toIndex + offset > lastIndex])
		ifTrue: [^self errorNoSuchElement].
	result := OrderedCollection new: toIndex - fromIndex + 1.
	fromIndex + offset to: toIndex + offset do:
		[:index | result addLast: (aBlock value: (array at: index))].
	^ result
