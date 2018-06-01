debug printing
heapMapAtWord: wordPointer
	"Implemented in support code for Cog branch in Cross/vm/sqHeapMap.c and
	stubbed out here for use with trunk platform sources"

	self flag: #FIXME. "remove this method and add sqHeapMap.c to Cross when 64 bit address space can be supported"
	^ 1

	"
	/*
	 * Answer non-zero if the heapMap is set at wordPointer, 0 otherwise
	 */
	int heapMapAtWord(void *wordPointer)
	{ . . . }
	"