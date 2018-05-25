fileIn/Out
nonTrivial 
	"Answer whether the receiver has any methods or instance variables."

	^ self instVarNames size > 0 or: [self methodDict size > 0 or: [self hasTraitComposition]]
