squeak protocol
days: days hours: hours minutes: minutes seconds: seconds nanoSeconds: nanos	

 	^self
		seconds: seconds
			+ (minutes * SecondsInMinute) 
			+ (hours * SecondsInHour)
			+ (days * SecondsInDay)
		nanoSeconds: nanos
