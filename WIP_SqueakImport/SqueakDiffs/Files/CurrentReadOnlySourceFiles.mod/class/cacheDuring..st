caching
cacheDuring: aBlock
	"Cache the read only source files on the first request and use them on subsequent requests during the evaluation of aBlock."
	
	| currentReadOnlySouceFiles |
	currentReadOnlySouceFiles := nil.
	^aBlock
		on: self
		do: [ :exception |
			exception resume: (currentReadOnlySouceFiles ifNil: [
				currentReadOnlySouceFiles := exception defaultAction ]) ]