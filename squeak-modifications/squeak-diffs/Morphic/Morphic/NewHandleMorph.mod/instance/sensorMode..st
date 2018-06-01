all
sensorMode: aBoolean

	"If our client is still addressing the Sensor directly, we need to do so as well"
	self setProperty: #sensorMode toValue: aBoolean.
