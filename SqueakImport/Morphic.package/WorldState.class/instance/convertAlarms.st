object fileIn
convertAlarms
	"We now store the alarms in a MorphicAlarmQueue, rather than a Heap."
	alarms ifNotNil: [
		alarms class == MorphicAlarmQueue ifFalse: [
			| oldAlarms |
			oldAlarms := alarms.
			alarms := MorphicAlarmQueue new.
			oldAlarms do: [:alarm | alarms add: alarm]			
		]
	].