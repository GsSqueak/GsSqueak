accessing
next
	"Answer a random 53-bit Float from the [0, 1) interval. The implementation assumes that the MTw parameter is between 27 and 53."
	
	^self nextValue asFloat * MTwFloatMultiplier + (self nextValue bitAnd: MTwFloatMultiplier - 1) / 9.007199254740992e15 "(1 << 53) asFloat"