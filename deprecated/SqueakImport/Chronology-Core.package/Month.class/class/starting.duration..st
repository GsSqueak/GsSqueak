squeak protocol
starting: aDateAndTime duration: aDuration 
	"Override - a each month has a defined duration"
	| start adjusted days |
	start := aDateAndTime asDateAndTime.
	adjusted := DateAndTime
		year: start year
		month: start month
		day: 1
		hour: 0
		minute: 0
		second: 0
		offset: start offset.
	days := self
		daysInMonth: adjusted month
		forYear: adjusted year.
	^ super
		starting: adjusted
		duration: (Duration days: days)