initialize
initialize

	super initialize.
	mutex := Mutex new.
	sequenceNumber := 0.
	heap := Heap sortBlock: [ :alarmA :alarmB |
		alarmA scheduledTime = alarmB scheduledTime 
			ifFalse: [ alarmA scheduledTime < alarmB scheduledTime ]
			ifTrue: [
				alarmA sequenceNumber = alarmB sequenceNumber
					ifFalse: [ alarmA sequenceNumber < alarmB sequenceNumber ]
					ifTrue: [ self error: 'These alarms run at the same time' ] ] ]