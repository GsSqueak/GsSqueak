*SqNumbers-truncation and round off
asLargerPowerOfTwo
	"Convert the receiver into a power of two which is not less than the receiver"
	self isPowerOfTwo
		ifTrue:[^self]
		ifFalse:[^1 bitShift: (self highBit)]