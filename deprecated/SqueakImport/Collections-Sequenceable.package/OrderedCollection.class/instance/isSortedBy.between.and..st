sorting
isSortedBy: aSortBlockOrNil between: startIndex and: endIndex
	"Return true if the receiver is sorted by aSortBlockOrNil between startIndex and endIndex. Use #<= for comparison if aSortBlockOrNil is nil."
	
	^array
		isSortedBy: aSortBlockOrNil
		between: startIndex + firstIndex - 1
		and: endIndex + firstIndex - 1