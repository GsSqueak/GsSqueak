testing - constants
testByte5ShiftNegated
	"Note - signed values are not relevant for bit mask operations, can be recoded as positive"

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory  initBytesPerWord: 4.
	self assert: ObjectMemory byte5ShiftNegated = 16r0000000000000000."

	self assert: ObjectMemory byte5ShiftNegated = -16r0000000000000028