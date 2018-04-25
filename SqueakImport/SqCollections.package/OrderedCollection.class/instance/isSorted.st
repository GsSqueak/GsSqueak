sorting
isSorted
	"Return true if the receiver is sorted by #<=."
	
	^array
		isSortedBetween: firstIndex
		and: lastIndex