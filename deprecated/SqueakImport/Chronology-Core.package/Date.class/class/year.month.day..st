squeak protocol
year: year month: month day: day 
	^ self starting:
		(DateAndTime
			year: year
			month: month
			day: day
			hour: 0
			minute: 0
			second: 0
			offset: self defaultOffset)