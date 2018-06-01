converting
readStream
	"Answer a ReadStream that returns all the elements of the receiver
	 in some UNSPECIFIED order."

	^ReadStream on: contents