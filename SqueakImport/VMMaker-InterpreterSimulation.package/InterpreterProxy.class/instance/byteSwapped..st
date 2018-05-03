other
byteSwapped: w
	"Return the given integer with its bytes in the reverse order."

	^ ((w bitShift: -24) bitAnd: 16rFF) +
	  ((w bitShift: -8) bitAnd: 16rFF00) +
	  ((w bitShift: 8) bitAnd: 16rFF0000) +
	  ((w bitShift: 24) bitAnd: 16rFF000000)
