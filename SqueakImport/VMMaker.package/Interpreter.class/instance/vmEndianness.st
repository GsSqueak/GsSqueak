plugin support
vmEndianness
	"return 0 for little endian, 1 for big endian"

	self isBigEnder ifTrue: [^ 1] ifFalse: [^ 0]
