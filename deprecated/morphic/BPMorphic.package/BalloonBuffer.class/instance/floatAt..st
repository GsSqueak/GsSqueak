accessing
floatAt: index 
	"For simulation only"
	self halt.
	^ Float
		fromIEEE32Bit: (self basicAt: index)