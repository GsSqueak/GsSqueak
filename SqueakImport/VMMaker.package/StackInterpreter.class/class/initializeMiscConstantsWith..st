initialization
initializeMiscConstantsWith: optionsDictionary

	super initializeMiscConstantsWith: optionsDictionary.
	STACKVM := true.
	NewspeakVM := optionsDictionary at: #NewspeakVM ifAbsent: [false].
	"N.B.  Not yet implemented!!"
	IMMUTABILITY := optionsDictionary at: #IMMUTABILITY ifAbsent: [false].

	DumpStackOnLowSpace := 0.
	PrimitiveExternalCallIndex := 117. "Primitive index for #primitiveExternalCall"
	MillisecondClockMask := 16r1FFFFFFF.

	MaxJumpBuf := 32. "max. callback depth"
	FailImbalancedPrimitives := true