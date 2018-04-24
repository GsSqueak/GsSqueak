sorting
isSortedBetween: startIndex and: endIndex
	"Return true if the receiver is sorted by #<= between startIndex and endIndex."
	
	^array isSortedBetween: startIndex + firstIndex - 1 and: endIndex + firstIndex - 1