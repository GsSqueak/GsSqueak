accessing
keysSortedSafely
	"Answer a sorted Array containing the receiver's keys."
	^ self keys sort:
		[ : x : y | x compareSafely: y ]