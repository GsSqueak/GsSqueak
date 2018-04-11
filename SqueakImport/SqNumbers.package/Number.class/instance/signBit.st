mathematical functions
signBit
	"Answer 1 if the receiver is negative, zero otherwise."

	self < 0 ifTrue: [^1].
	^0