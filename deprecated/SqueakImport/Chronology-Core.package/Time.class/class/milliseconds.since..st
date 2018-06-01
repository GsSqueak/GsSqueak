squeak protocol
milliseconds: currentTime since: lastTime
	"Answer the elapsed time since last recorded in milliseconds (i.e. of millisecondClockValue).
	 Since the time basis is now a 61-bit or greater UTC microsecond clock, rollover is no longer an issue."

	^currentTime - lastTime