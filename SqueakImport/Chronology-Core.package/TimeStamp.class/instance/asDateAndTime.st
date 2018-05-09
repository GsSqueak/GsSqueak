squeak protocol
asDateAndTime
	"Answer the receiver as an instance of DateAndTime."

	^ DateAndTime new setJdn: jdn seconds: seconds nano: nanos offset: offset