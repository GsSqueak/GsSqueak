clock
localMicrosecondClockPrimitive
	"Answer the local microseconds since the Smalltalk epoch (January 1st 1901, the start of the 20th century).
	 The value is derived from the Posix epoch with a constant offset corresponding to elapsed microseconds
	 between the two epochs according to RFC 868, and with an offset duration corresponding to the current
	 offset of local time from UTC."
	| timeAndOffset |
	timeAndOffset := Time primPosixMicrosecondClockWithOffset.
	^ timeAndOffset first + 2177452800000000 + (timeAndOffset second * 1000000)
