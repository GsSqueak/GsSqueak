ansi protocol
now
	"Answer a Time representing the time right now - this is a 24 hour clock."
	| localUsecs localUsecsToday |
	localUsecs := self localMicrosecondClock.
	localUsecsToday := localUsecs \\ MicrosecondsInDay.
	^ self
		seconds: localUsecsToday // 1000000
		nanoSeconds: localUsecsToday \\ 1000000 * 1000