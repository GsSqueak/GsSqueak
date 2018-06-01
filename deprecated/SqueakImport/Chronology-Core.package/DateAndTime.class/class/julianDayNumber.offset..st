squeak protocol
julianDayNumber: anInteger offset: aDuration 

	^self basicNew
		setJdn: anInteger
		seconds: 0
		nano: 0
		offset: aDuration