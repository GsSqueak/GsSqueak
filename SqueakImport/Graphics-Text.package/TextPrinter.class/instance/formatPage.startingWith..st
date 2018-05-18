formatting
formatPage: pageNum startingWith: anIndex
	"Format a new page starting at the given string index. Return the string index indicating the start of the next page or nil if no more pages need printing."
	| nextIndex |
	nextIndex := anIndex.
	1 to: self columns do:[:i|
		nextIndex := self formatColumn: i startingWith: nextIndex.
		nextIndex isNil ifTrue:[^nil].
	].
	^nextIndex