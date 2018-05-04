testing - constants
testByte4Shift

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory initBytesPerWord: 4.
	self assert: ObjectMemoryConstantsAccess byte4Shift = 0."

	self assert: ObjectMemory byte4Shift = 32