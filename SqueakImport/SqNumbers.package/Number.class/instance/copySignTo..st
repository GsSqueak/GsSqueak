mathematical functions
copySignTo: aNumber
	"Return a number with same magnitude as aNumber and same sign as self."

	^ self signBit = 0
		ifTrue: [aNumber abs]
		ifFalse: [aNumber abs negated].