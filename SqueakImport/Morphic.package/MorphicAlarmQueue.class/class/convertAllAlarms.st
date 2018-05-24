class initialization
convertAllAlarms
	"Alarms should be kept in a MorphicAlarmQueue, not a Heap."
	WorldState allSubInstancesDo: [:ws | ws convertAlarms]