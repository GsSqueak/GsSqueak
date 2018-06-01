debug printing
heapMapAtWord: wordPointer Put: bit
	"Implemented in support code for Cog branch in Cross/vm/sqHeapMap.c and
	stubbed out here for use with trunk platform sources"

	self flag: #FIXME. "remove this method and add sqHeapMap.c to Cross when 64 bit address space can be supported"

	"
	/*
	 * Set the value in the map at wordPointer to bit.
	 */
	void heapMapAtWordPut(void *wordPointer, int bit)
	{ . . . }
	"