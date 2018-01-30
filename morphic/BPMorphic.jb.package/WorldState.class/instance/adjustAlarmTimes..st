alarms
adjustAlarmTimes: nowTime 
	"Adjust the alarm times after some clock weirdness (such as roll-over,
	image-startup etc)"
	| deltaTime |
	(deltaTime := nowTime - lastAlarmTime) = 0
		ifTrue: [^ self].
	self
		lockAlarmsDuring: [:locked | locked incrementScheduledTimesBy: deltaTime]