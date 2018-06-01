sorting
isSorted
	"Return true if the receiver is sorted by #<=."
	
	^ order
		isSortedBetween: 1
		and: tally