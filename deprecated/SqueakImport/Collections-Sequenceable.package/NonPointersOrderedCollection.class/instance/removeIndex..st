private
removeIndex: removedIndex
 	"Same as super without trying to store nil in the emptied slot of array."

	array 
		replaceFrom: removedIndex 
		to: lastIndex - 1 
		with: array 
		startingAt: removedIndex + 1.
	lastIndex := lastIndex - 1.