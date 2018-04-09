*SqNumbers-truncation and round off
asSmallerPowerOfTwo
	"Convert the receiver into a power of two which is not larger than the receiver"
	self isPowerOfTwo
		ifTrue:[^self]
		ifFalse:[^1 bitShift: (self highBit - 1)]