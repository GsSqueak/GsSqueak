squeak protocol
year: year day: dayOfYear 
	^ self starting:
		(DateAndTime
			year: year
			day: dayOfYear
			hour: 0
			minute: 0
			second: 0
			offset: self defaultOffset)