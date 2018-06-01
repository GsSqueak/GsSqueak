timer process
scheduleDelay: aDelay from: nowUsecs
	"Private. Schedule this Delay."
	
	aDelay
		resumptionTime: nowUsecs + aDelay microsecondDelayDuration;
		beingWaitedOn: true.
	ActiveDelay 
		ifNil: [ActiveDelay := aDelay]
		ifNotNil:
			[aDelay resumptionTime < ActiveDelay resumptionTime
				ifTrue: [SuspendedDelays add: ActiveDelay.
						ActiveDelay := aDelay]
				ifFalse: [SuspendedDelays add: aDelay]]