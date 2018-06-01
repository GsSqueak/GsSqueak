class initialization
initializeBitCountPerByteTable
	"Initialize BitCountPerByteTable which is a ByteArray that contains the number of set bits (1) of the integers between 0 and 255. It's defined as a class variable so that it can be used from the instance side and subclasses too."
	"Evaluate this expression to form the byte array:
	((0 to: 255)
		collect: [:i | 
			| bitCount n |
			n := i.
			bitCount := 0.
			[n = 0]
				whileFalse:
					[bitCount := bitCount + 1.
					n := n bitAnd: n - 1].
			bitCount]
		as: ByteArray)"
	
	BitCountPerByteTable := #[0 1 1 2 1 2 2 3 1 2 2 3 2 3 3 4 1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5 1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5 2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6 1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5 2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6 2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6 3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7 1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5 2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6 2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6 3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7 2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6 3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7 3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7 4 5 5 6 5 6 6 7 5 6 6 7 6 7 7 8]