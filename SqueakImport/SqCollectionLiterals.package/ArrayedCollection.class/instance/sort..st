*SqCollectionLiterals-*SqCollectionLiterals-sorting
sort: aSortBlock 
	"Sort this array using aSortBlock. The block should take two arguments
	and return true if the first element should preceed the second one.
	If aSortBlock is nil then <= is used for comparison."

	self
		mergeSortFrom: 1
		to: self size
		by: aSortBlock
