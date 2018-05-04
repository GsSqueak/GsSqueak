testing - constants
testByte7Shift

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory initBytesPerWord: 4.
	self assert: ObjectMemory byte7Shift = 0."

	self assert: ObjectMemory byte7Shift = 56