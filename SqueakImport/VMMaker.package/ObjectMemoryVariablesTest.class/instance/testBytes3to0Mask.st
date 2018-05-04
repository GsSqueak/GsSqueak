testing - constants
testBytes3to0Mask

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory initBytesPerWord: 4.
	self assert: ObjectMemory bytes3to0Mask = 16r0000000000000000."

	self assert: ObjectMemory bytes3to0Mask = 16r00000000FFFFFFFF