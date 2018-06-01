sorting
isSorted
	"Return true if the receiver is sorted by #<=."

	^self isSortedBetween: 1 and: self size