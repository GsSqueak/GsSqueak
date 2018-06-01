class initialization
initialize
	"XBMReadWriter initialize"
	Flipbits := (0 to: 255) collect:
		[:n |  "Compute the bit-reversal of the 8-bit value, n"
		| flippedByte |
		flippedByte := 0.
		0 to: 7 do: 
			[:i | 
			flippedByte := flippedByte bitOr: ((n >> i bitAnd: 1) << (7-i))].
			flippedByte]