squeak protocol
year: aYear 
	^ self starting:
		(DateAndTime
			year: aYear
			month: 1
			day: 1
			hour: 0
			minute: 0
			second: 0
			offset: self defaultOffset)