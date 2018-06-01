-widgets-events
enabled
	"Check whether this morph is capable of proecssing user input events."
	^ self
		valueOfProperty: #enabled
		ifAbsentPut: [true]