garbage collection
biasToGrowCheckGCLimit
	| growth |
	growth := (youngStart - memory) - gcBiasToGrowThreshold.
	growth < 0 ifTrue: [gcBiasToGrowThreshold := youngStart - memory].
	growth > gcBiasToGrowGCLimit
		 ifTrue: 
			[self fullGC.
			gcBiasToGrowThreshold := youngStart - memory].

					