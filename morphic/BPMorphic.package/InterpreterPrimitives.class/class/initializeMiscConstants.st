class initialization
initializeMiscConstants
	"Initialize the hashMultiply constants."
	super initializeMiscConstants.
	HashMultiplyConstant := 1664525.
	HashMultiplyMask := 268435455
	"(2 raisedTo: 28) - 1"