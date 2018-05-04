testing - constants
testByte5Mask

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory initBytesPerWord: 4.
	self assert: ObjectMemory byte5Mask = 16r0000000000000000."

	self assert: ObjectMemory byte5Mask = 16r0000FF0000000000