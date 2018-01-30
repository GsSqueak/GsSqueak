other
byteSwapped: w 
	"Return the given integer with its bytes in the reverse order."
	^ ((w bitShift: -24)
		bitAnd: 255)
		+ ((w bitShift: -8)
				bitAnd: 65280)
		+ ((w bitShift: 8)
				bitAnd: 16711680)
		+ ((w bitShift: 24)
				bitAnd: 4278190080)