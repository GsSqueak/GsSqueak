read write
setStream: aStream
	"Initialize me. "

	self flag: #bobconv.	

	super setStream: aStream.
	self initShapeDicts.

