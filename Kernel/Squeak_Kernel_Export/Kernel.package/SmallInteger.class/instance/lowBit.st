bit manipulation
lowBit
	" Answer the index of the low order one bit.
		2r00101000 lowBit       (Answers: 4)
		2r-00101000 lowBit      (Answers: 4)
	  First we skip bits in groups of 8, then do a lookup in a table.
	  While not optimal, this is a good tradeoff; long
	  integer #lowBit always invokes us with bytes."

	| n result lastByte |
	n := self.
	n = 0 ifTrue: [ ^ 0 ].
	result := 0.
	[(lastByte := n bitAnd: 16rFF) = 0]
		whileTrue: [
			result := result + 8.
			n := n bitShift: -8 ].
	^result + (LowBitPerByteTable at: lastByte)