alarms
addAlarm: aSelector withArguments: argArray for: aTarget at: scheduledTime 
	"Add a new alarm with the given set of parameters"
	self
		lockAlarmsDuring: [:locked | locked
				add: (MorphicAlarm
						scheduledAt: scheduledTime
						receiver: aTarget
						selector: aSelector
						arguments: argArray)]