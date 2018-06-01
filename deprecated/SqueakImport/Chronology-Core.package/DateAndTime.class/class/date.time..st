squeak protocol
date: aDate time: aTime

	^ self 
		year: aDate year 
		day: aDate dayOfYear 
		hour: aTime hour 
		minute: aTime minute 
		second: aTime second
		offset: aDate start offset