private
growSize
	"Answer what my next table size should be.
	Note that, it can be less than the current."
	
	^self class goodPrimeAtLeast: self slowSize * 2 + 2