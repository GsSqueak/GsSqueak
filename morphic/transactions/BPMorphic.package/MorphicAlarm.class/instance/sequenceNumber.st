accessing
sequenceNumber
	"Answer the sequence number of the alarm, which is used to preserve
	ordering for alarms scheduled for the same time."
	^ sequenceNumber
		ifNil: [0]