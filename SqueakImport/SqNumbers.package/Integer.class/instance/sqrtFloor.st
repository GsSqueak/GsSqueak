mathematical functions
sqrtFloor
	"Return the integer part of the square root of self"

	| guess delta |
	guess := 1 bitShift: self highBit + 1 // 2.
	[
		delta := guess squared - self // (guess bitShift: 1).
		delta = 0 ] whileFalse: [
			guess := guess - delta ].
	^guess - 1