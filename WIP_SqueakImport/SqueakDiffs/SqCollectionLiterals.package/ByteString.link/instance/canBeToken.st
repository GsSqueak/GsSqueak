testing
canBeToken
	"Optimized version for the common case."
	
	^ (self findSubstring: '~' in: self startingAt: 1 matchTable: Tokenish) = 0 
		
