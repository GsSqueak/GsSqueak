sorting
sort: aSortBlock 
	"Sort this collection using aSortBlock. The block should take two arguments
	and return true if the first element should preceed the second one.
	If aSortBlock is nil then <= is used for comparison."

	super sort: aSortBlock.
	sortBlock := aSortBlock