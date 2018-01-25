bit manipulation
bitCount
	"Count the number of bits set to 1 in self"

	| bitCount |
	self < 0 ifTrue: [self error: 'Cannot count bits of negative integers'].
	bitCount := 0.
	1 to: self digitLength do: [:i |
		bitCount := bitCount + (self digitAt: i) bitCountOfByte].
	^bitCount