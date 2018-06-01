sorting
quickSort: sortBlock
	"Sort elements of self to be nondescending according to sortBlock using an in-place quicksort with simple median-of-three partitioning with guaranteed O(log(n)) space usage."

	self quickSortFrom: 1 to: self size by: sortBlock