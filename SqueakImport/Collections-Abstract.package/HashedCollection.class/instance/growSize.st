private
growSize
	"Answer what my next higher table size should be"
	
	^self class goodPrimeAtLeast: array size * 3 // 2 + 2