testing - constants
testByte7Mask

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory initBytesPerWord: 4.
	self assert: ObjectMemory byte7Mask = 16r0000000000000000."

	self assert: ObjectMemory byte7Mask = 16rFF00000000000000