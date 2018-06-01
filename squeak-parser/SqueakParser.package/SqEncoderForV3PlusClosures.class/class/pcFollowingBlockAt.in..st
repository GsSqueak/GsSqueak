bytecode decoding
pcFollowingBlockAt: pc in: method 
	"Assuming the pc is that of a block creation bytecode, answer the pc
	immediately following the block,
	i.e. the next pc after the block creation."
	self assert: (method at: pc)
			= self createClosureCode.
	^ (method at: pc + 2)
		* 256
		+ (method at: pc + 3) + pc + 4