events-alarms
removeAlarm: aSelector at: scheduledTime
	"Remove the given alarm"
	| scheduler |
	scheduler := self alarmScheduler.
	scheduler ifNotNil:[scheduler removeAlarm: aSelector at: scheduledTime for: self].