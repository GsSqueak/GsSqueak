compatibility
fullCheck
	"This is a private method, formerly implemented in Set, that is no longer required.
	It is here for compatibility with external packages only."
	"Keep array at least 1/4 free for decent hash behavior"
	
	array size * 3 < (tally * 4) ifTrue: [ self grow ]