squeak protocol
midnight
	"Answer a DateAndTime starting at midnight of the same timezone offset as the receiver."
	^ self class basicNew
		setJdn: jdn
		seconds: 0
		nano: 0
		offset: offset