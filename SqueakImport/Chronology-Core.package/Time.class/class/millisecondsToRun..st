general inquiries
millisecondsToRun: timedBlock 
	"Answer the number of milliseconds timedBlock takes to return its value."

	| startUsecs |
	startUsecs := self utcMicrosecondClock.
	timedBlock value.
	^self utcMicrosecondClock - startUsecs + 500 // 1000