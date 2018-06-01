class initialization
eventPollPeriod
	^ EventPollPeriod
		ifNil: [EventPollPeriod := 500]