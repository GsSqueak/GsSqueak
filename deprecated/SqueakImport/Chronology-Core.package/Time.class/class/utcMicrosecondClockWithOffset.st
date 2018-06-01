clock
utcMicrosecondClockWithOffset
	"Answer an array with UTC microseconds since the Smalltalk epoch and the
	current seconds offset from UTC in the local time zone."
	| offset utc |
	utc := self utcMicrosecondClock. 
	offset := (self localMicrosecondClockPrimitive - utc) // 1000000.
	^{utc. offset}