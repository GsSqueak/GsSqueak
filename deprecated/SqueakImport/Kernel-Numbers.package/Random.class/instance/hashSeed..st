private
hashSeed: anInteger
	"Use the 32-bit version of the FNV-1a algorithm to hash the seed, and return a 32-bit unsigned integer."

	| fnvPrime hash |
	fnvPrime := 16777619 " 32-bit FVN prime ".
	hash := anInteger negative
		ifTrue: [  3490449840 "  mix in the sign as (2166136261 bitXor: 2r1010101) * 16777619 bitAnd: 16rFFFFFFFF "]
		ifFalse: [ 2166136261 " 32-bit FVN offset basis "].
	1 to: anInteger digitLength do: [ :index |
		hash := 16rFFFFFFFF bitAnd: (hash bitXor: (anInteger digitAt: index)) * fnvPrime ].
	^hash