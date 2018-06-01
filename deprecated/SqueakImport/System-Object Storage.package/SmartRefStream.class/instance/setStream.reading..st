read write
setStream: aStream reading: isReading
	"Initialize me. "

	self flag: #bobconv.	

	super setStream: aStream reading: isReading.
	isReading ifFalse: [^ false].
	self initShapeDicts.

