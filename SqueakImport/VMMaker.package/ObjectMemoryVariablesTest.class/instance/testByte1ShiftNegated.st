testing - constants
testByte1ShiftNegated
	"Note - signed values are not relevant for bit mask operations, can be recoded as positive"

	self assert: ObjectMemory byte1ShiftNegated = -16r0000000000000008.