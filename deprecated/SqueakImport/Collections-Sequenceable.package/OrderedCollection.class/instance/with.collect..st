enumerating
with: otherCollection collect: twoArgBlock 
	"Collect and return the result of evaluating twoArgBlock with 
	corresponding elements from this collection and otherCollection."

	| result offset size |
	(size := self size) = otherCollection size ifFalse: [ self error: 'otherCollection must be the same size' ].
	result := OrderedCollection new: size.
	offset := 1 - firstIndex.
	firstIndex to: lastIndex do: [ :index |
		result addLast: (
			twoArgBlock 
				value: (array at: index)
				value: (otherCollection at: index + offset)) ].
	^result