clock
localMicrosecondClock
	"Answer the local microseconds since the Smalltalk epoch (January 1st 1901, the start of the 20th century).
	 The value is derived from the current UTC wallclock time and the image's current notion of time zone."
	^self utcMicrosecondClock + (DateAndTime localOffset asSeconds * 1000000)