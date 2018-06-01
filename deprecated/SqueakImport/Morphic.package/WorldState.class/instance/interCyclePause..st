update cycle
interCyclePause: milliSecs
	"delay enough that the previous cycle plus the amount of delay will equal milliSecs.  If the cycle is already expensive, then no delay occurs.  However, if the system is idly waiting for interaction from the user, the method will delay for a proportionally long time and cause the overall CPU usage of Squeak to be low.
	If the preference #serverMode is enabled, always do a complete delay of 50ms, independant of my argument. This prevents the freezing problem described in Mantis #6581"

	| millisecondsToWait |
	millisecondsToWait := Preferences serverMode
		ifTrue: [ 50 ]
		ifFalse: [
			(lastCycleTime isNil or: [ CanSurrenderToOS == false ])
				ifTrue: [ 0 ]
				ifFalse: [ milliSecs - (Time millisecondsSince: lastCycleTime) ] ].
	(Preferences serverMode or: [millisecondsToWait > 0 and: [millisecondsToWait <= milliSecs]])
		ifTrue: [
			(interCycleDelay isNil or: [ interCycleDelay beingWaitedOn ])
				ifTrue: [ interCycleDelay := Delay forMilliseconds: millisecondsToWait ]
				ifFalse: [ interCycleDelay delayDuration: millisecondsToWait ].
			interCycleDelay wait ].
	lastCycleTime := Time millisecondClockValue.
	CanSurrenderToOS := true.