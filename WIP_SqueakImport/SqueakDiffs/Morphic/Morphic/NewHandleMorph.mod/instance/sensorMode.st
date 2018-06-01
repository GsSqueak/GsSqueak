all
sensorMode

	"If our client is still addressing the Sensor directly, we need to do so as well"
	^self valueOfProperty: #sensorMode ifAbsent: [false].
