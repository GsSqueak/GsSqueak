testing - constants
testByte4Mask

	"Note - unused for 32-bit object memory, so 32-bit test is no longer relevant
	ObjectMemory initBytesPerWord: 4.
	self assert: ObjectMemory byte4Mask = 16r0000000000000000."

	self assert: ObjectMemory byte4Mask = 16r000000FF00000000