public
delayDuration: milliseconds
	"Set teh receiver's duration in milliseconds, iff it is not active."
	milliseconds < 0 ifTrue:
		[self error: 'Delay times cannot be negative!'].
	beingWaitedOn == true ifTrue:
		[self error: 'This delay is scheduled!'].
	delayDuration := milliseconds asInteger