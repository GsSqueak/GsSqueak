I/O primitives support
ioMicroSecondClock
	"Answer the value of the high-resolution millisecond clock."

	^ self ioMicroMSecs * 1000
