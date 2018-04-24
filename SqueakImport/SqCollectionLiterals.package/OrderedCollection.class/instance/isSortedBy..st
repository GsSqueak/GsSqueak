sorting
isSortedBy: aSortBlockOrNil
	"Return true if the receiver is sorted by aSortBlockOrNil. Use #<= for comparison if aSortBlockOrNil is nil."
	
	^array
		isSortedBy: aSortBlockOrNil
		between: firstIndex
		and: lastIndex