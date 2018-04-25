*Collections-SortFunctions-converting
collatedBy: aSortFunction
	"Return a SortFunction around the receiver, where the receiver will be used as a unary message to send to both a and b during sorting, and then the result of said send will be collated iusing aSortFunction."
	"#('abc' 'de' 'fghi') sorted: (#size collatedWith: [:e|e bitAnd: 1]) , #size >>> #( 'de' 'fghi' 'abc')"

	^PropertySortFunction property: self collatedWith: aSortFunction asSortFunction