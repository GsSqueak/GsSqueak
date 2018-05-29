accessing
getStepCount

	^[self contents asNumber] ifError: [ :a :b | 10]
	
