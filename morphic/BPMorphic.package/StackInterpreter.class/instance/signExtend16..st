utilities
signExtend16: int16 
	"Convert a signed 16-bit integer into a signed 32-bit integer value. The
	integer bit is not added here."
	(int16 bitAnd: 32768)
			= 0
		ifTrue: [^ int16]
		ifFalse: [^ int16 - 65536]