alarms
lockAlarmsDuring: actionBlock 
	"All accesses to the alarms queue is synchronized by a mutex. Answer
	the result of evaluating the 1-argument 'actionBlock'."
	alarms
		ifNil: [alarms := MorphicAlarmQueue new].
	^ alarms mutex
		critical: [actionBlock value: alarms]