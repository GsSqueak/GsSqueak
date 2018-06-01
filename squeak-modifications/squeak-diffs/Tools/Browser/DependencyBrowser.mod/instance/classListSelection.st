class list
classListSelection
	"Class list selection"
	^(self classListIndex between: 1 and: self classList size)
		ifTrue:[self classList at: self classListIndex]