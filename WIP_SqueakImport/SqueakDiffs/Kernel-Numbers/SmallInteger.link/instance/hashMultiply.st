bit manipulation
hashMultiply
	"This is a multiplication by by 1664525 mod 2^28 written to avoid overflowing into large integers.
	 The primitive was able to perform the operation with modulo arihmetic."
	| low |
	low := self bitAnd: 16383.
	^(16r260D * low + ((16r260D * (self bitShift: -14) + (16r0065 * low) bitAnd: 16383) * 16384))
			bitAnd: 16r0FFFFFFF
