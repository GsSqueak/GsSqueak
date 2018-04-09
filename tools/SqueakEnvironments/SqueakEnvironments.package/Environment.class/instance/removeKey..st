emulating
removeKey: key 
	"Remove key from the receiver.
	If key is not in the receiver, notify an error."
	self flag: #review.
	^ self
		removeKey: key
		ifAbsent: [self errorKeyNotFound: key]