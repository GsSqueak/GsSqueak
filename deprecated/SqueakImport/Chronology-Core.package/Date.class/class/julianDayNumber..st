squeak protocol
julianDayNumber: aJulianDayNumber 
	^ self starting:
		(DateAndTime
			julianDayNumber: aJulianDayNumber
			offset: self defaultOffset)