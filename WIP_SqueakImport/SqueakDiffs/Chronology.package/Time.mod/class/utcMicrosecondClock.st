clock
utcMicrosecondClock
	"Answer the UTC microseconds since the Smalltalk epoch (January 1st 1901, the start of the 20th century).
	 The value is derived from the Posix epoch with a constant offset corresponding to elapsed microseconds
	 between the two epochs according to RFC 868."
	^ self primPosixMicrosecondClockWithOffset first + 2177452800000000
