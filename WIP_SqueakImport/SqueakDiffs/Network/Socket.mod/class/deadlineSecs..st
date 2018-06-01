utilities
deadlineSecs: secs
	"Answer a deadline time in milliseconds a given number of seconds from now.
	 Note that because the millisecondClockValue is derived from the non-wrapping
	 61-bit microsecond clock there is no roll over issue."

	^Time millisecondClockValue + (secs * 1000) truncated
