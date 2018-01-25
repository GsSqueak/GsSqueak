bit manipulation
lowBit
	"Answer the index of the low order bit of this number."
	
	| index digit |
	index := 0.
	[ (digit := self digitAt: (index := index + 1)) = 0 ] whileTrue.
	^(LowBitPerByteTable at: digit) + (index - 1 * 8)