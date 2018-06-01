class initialization
initializeLowBitPerByteTable
	"Initialize LowBitPerByteTable which is a ByteArray that contains the index of the lowest set bit of the integers between 1 and 255. It's defined as a class variable because it's used from the instance side and subclasses."
	"The low bits table can be obtained with:
	((1 to: 8) inject: #[1] into: [:lowBits :rank | (lowBits copy at: 1 put: lowBits first + 1; yourself) , lowBits]) allButFirst
	or with it's symmetric pair:
	((1 to: 8) inject: #[1] into: [:lowBits :rank | lowBits, (lowBits copy atLast: 1 put: lowBits last + 1; yourself)]) allButLast."
	
	LowBitPerByteTable := #[1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 6 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 7 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 6 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 8 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 6 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 7 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 6 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1]